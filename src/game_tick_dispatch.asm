; Game tick processing and player-state synchronization.
bits 32
org START_ADDRESS

    push ebx
    push ecx
    push edx
    push esi
    push edi
    push ebp
    sub esp, 0x24
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
    mov eax, dword [LINK_ADDRESS_6]
    add eax, 4
    cmp eax, dword [TOTALCLOCK]
    jg near loc_01e5
    cmp byte [LINK_ADDRESS_8], 0
    je near loc_01e5
    mov dword [LINK_ADDRESS_6], eax
    call 0x10800
    call LINK_ADDRESS_9
    cmp eax, 0x10
    jge near loc_01e5
    movsx ecx, word [CONNECTHEAD]
    jmp short loc_00af
loc_0081:
    movsx eax, word [MYCONNECTINDEX]
    cmp ecx, eax
    je short loc_00a7
    mov eax, dword [eax*4 + LINK_ADDRESS_12]
    mov ebx, dword [ecx*4 + LINK_ADDRESS_12]
    sub eax, 0xc8
    cmp eax, ebx
    jg near loc_01e5
loc_00a7:
    movsx ecx, word [nosplit ecx*2 + CONNECTPOINT2]
loc_00af:
    test ecx, ecx
    jge short loc_0081
    movsx eax, word [MYCONNECTINDEX]
    call LINK_ADDRESS_14
    movsx eax, word [LINK_ADDRESS_15]
    mov ebx, dword [LINK_ADDRESS_16]
    mov ecx, dword [LINK_ADDRESS_17]
    mov esi, dword [LINK_ADDRESS_18]
    mov edi, dword [LINK_ADDRESS_19]
    mov ebp, dword [LINK_ADDRESS_20]
    add ebx, eax
    movsx eax, word [LINK_ADDRESS_21]
    mov dword [LINK_ADDRESS_16], ebx
    add ecx, eax
    xor ebx, ebx
    movsx eax, byte [LINK_ADDRESS_22]
    mov bl, byte [LINK_ADDRESS_23]
    mov dword [LINK_ADDRESS_17], ecx
    movsx ecx, word [MYCONNECTINDEX]
    add esi, eax
    movsx eax, byte [LINK_ADDRESS_24]
    mov dword [LINK_ADDRESS_18], esi
    lea edx, [ecx*4]
    lea esi, [ebx - 1]
    add edi, eax
    mov eax, dword [LINK_ADDRESS_25]
    mov dword [LINK_ADDRESS_19], edi
    or ebp, eax
    lea eax, [ecx*4]
    mov dword [LINK_ADDRESS_20], ebp
    add ecx, eax
    mov eax, dword [edx + LINK_ADDRESS_12]
    add ecx, ecx
    test esi, eax
    je near loc_01ef
    mov ebx, eax
    and ebx, 0xff
    lea eax, [ebx*4]
    add eax, ebx
    mov edx, dword [edx + LINK_ADDRESS_12]
    shl eax, 5
    dec edx
    add eax, LINK_ADDRESS_26
    and edx, 0xff
    lea edi, [eax + ecx]
    lea eax, [edx*4]
    add eax, edx
    shl eax, 5
    add eax, LINK_ADDRESS_26
    lea esi, [eax + ecx]
    mov ecx, 0xa
    cmp ecx, 4
    jae short loc_01ac
    test cl, 1
    je short loc_01a5
    movsb
loc_01a5:
    shr ecx, 1
    db 0xf3
    movsw
    jmp short loc_01d7
loc_01ac:
    test edi, 1
    je short loc_01b6
    movsb
    dec ecx
loc_01b6:
    test edi, 2
    je short loc_01c3
    movsw
    sub ecx, 2
loc_01c3:
    mov ebx, ecx
    shr ecx, 2
    rep movsd
    test bl, 2
    je short loc_01d1
    movsw
loc_01d1:
    test bl, 1
    je short loc_01d7
    movsb
loc_01d7:
    movsx eax, word [MYCONNECTINDEX]
    inc dword [eax*4 + LINK_ADDRESS_12]
loc_01e5:
    add esp, 0x24
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
loc_01ef:
    mov edx, eax
    and edx, 0xff
    lea eax, [edx*4]
    add eax, edx
    shl eax, 5
    add eax, LINK_ADDRESS_26
    lea edi, [eax + ecx]
    mov eax, dword [LINK_ADDRESS_16]
    mov edx, eax
    sar edx, 0x1f
    idiv ebx
    mov word [edi + 2], ax
    mov eax, dword [LINK_ADDRESS_17]
    xor ebx, ebx
    mov edx, eax
    mov bl, byte [LINK_ADDRESS_23]
    sar edx, 0x1f
    idiv ebx
    mov word [edi + 4], ax
    mov eax, dword [LINK_ADDRESS_18]
    xor ebx, ebx
    mov edx, eax
    mov bl, byte [LINK_ADDRESS_23]
    sar edx, 0x1f
    idiv ebx
    mov byte [edi], al
    mov eax, dword [LINK_ADDRESS_19]
    xor ebx, ebx
    mov edx, eax
    mov bl, byte [LINK_ADDRESS_23]
    sar edx, 0x1f
    idiv ebx
    mov byte [edi + 1], al
    mov eax, dword [LINK_ADDRESS_20]
    mov dword [edi + 6], eax
    xor edx, edx
    movsx eax, word [MYCONNECTINDEX]
    mov dword [LINK_ADDRESS_20], edx
    mov dword [LINK_ADDRESS_19], edx
    mov dword [LINK_ADDRESS_18], edx
    mov dword [LINK_ADDRESS_17], edx
    mov ebp, dword [eax*4 + LINK_ADDRESS_12]
    mov dword [LINK_ADDRESS_16], edx
    inc ebp
    mov dx, word [NUMPLAYERS]
    mov dword [eax*4 + LINK_ADDRESS_12], ebp
    cmp dx, 2
    jge near loc_0337
    cmp dword [LINK_ADDRESS_28], 1
    jle near loc_01e5
    movsx ecx, word [CONNECTHEAD]
    test ecx, ecx
    jge short loc_02d1
    add esp, 0x24
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
loc_02d1:
    movsx eax, word [MYCONNECTINDEX]
    cmp ecx, eax
    je short loc_0321
    cmp dword [LINK_ADDRESS_29], 0
    je short loc_031a
    mov edx, dword [ecx*4 + LINK_ADDRESS_12]
    and edx, 0xff
    lea eax, [edx*4]
    add eax, edx
    mov ebx, LINK_ADDRESS_26
    shl eax, 5
    add ebx, eax
    lea eax, [ecx*4]
    add eax, ecx
    add eax, eax
    lea edx, [ebx + eax]
    mov eax, ecx
    call LINK_ADDRESS_30
loc_031a:
    inc dword [ecx*4 + LINK_ADDRESS_12]
loc_0321:
    movsx ecx, word [nosplit ecx*2 + CONNECTPOINT2]
    test ecx, ecx
    jge short loc_02d1
    add esp, 0x24
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
loc_0337:
    movsx ecx, word [CONNECTHEAD]
    jmp short loc_0392
loc_0340:
    movsx eax, word [MYCONNECTINDEX]
    cmp ecx, eax
    je short loc_038a
    mov eax, dword [eax*4 + LINK_ADDRESS_12]
    lea edx, [ecx*4]
    dec eax
    mov ebp, dword [edx + LINK_ADDRESS_12]
    mov ebx, dword [edx + LINK_ADDRESS_31]
    sub eax, ebp
    cmp eax, ebx
    jle short loc_0370
    mov edx, ebx
    jmp short loc_0372
loc_0370:
    mov edx, eax
loc_0372:
    mov esi, dword [LINK_ADDRESS_32]
    mov dword [ecx*4 + LINK_ADDRESS_31], edx
    cmp eax, esi
    jge short loc_0385
    mov eax, esi
loc_0385:
    mov dword [LINK_ADDRESS_32], eax
loc_038a:
    movsx ecx, word [nosplit ecx*2 + CONNECTPOINT2]
loc_0392:
    test ecx, ecx
    jge short loc_0340
    movsx eax, word [MYCONNECTINDEX]
    mov eax, dword [eax*4 + LINK_ADDRESS_12]
    dec eax
    test al, 0x1f
    jne short loc_03e9
    mov ecx, dword [LINK_ADDRESS_32]
    mov esi, dword [LINK_ADDRESS_33]
    xor edi, edi
    sub ecx, esi
    mov dword [LINK_ADDRESS_32], edi
    test ecx, ecx
    jle short loc_03d3
    add ecx, 3
    sar ecx, 2
    lea eax, [esi + ecx]
    mov dword [LINK_ADDRESS_33], eax
    jmp short loc_03e9
loc_03d3:
    jge short loc_03e9
    mov eax, 1
    sub eax, ecx
    mov ebp, esi
    sar eax, 2
    sub ebp, eax
    mov dword [LINK_ADDRESS_33], ebp
loc_03e9:
    cmp byte [LINK_ADDRESS_34], 1
    jne near loc_078e
    mov byte [LINK_ADDRESS_35], 0x11
    movsx eax, word [MYCONNECTINDEX]
    mov eax, dword [eax*4 + LINK_ADDRESS_12]
    dec eax
    jne short loc_0415
    mov byte [LINK_ADDRESS_35], 0x10
loc_0415:
    movsx eax, word [MYCONNECTINDEX]
    mov esi, 1
    mov eax, dword [eax*4 + LINK_ADDRESS_12]
    sub eax, esi
    test al, 0x1f
    jne near loc_0553
    mov ax, word [MYCONNECTINDEX]
    mov cx, word [CONNECTHEAD]
    cmp ax, cx
    je near loc_04ba
    movsx eax, cx
    mov ebp, dword [LINK_ADDRESS_36]
    mov ecx, dword [eax*4 + LINK_ADDRESS_31]
    sub ecx, ebp
    mov eax, ecx
    test eax, eax
    jns short loc_0462
    neg eax
loc_0462:
    cmp eax, 8
    jle short loc_046b
    sar ecx, 1
    jmp short loc_0488
loc_046b:
    mov eax, ecx
    test eax, eax
    jns short loc_0473
    neg eax
loc_0473:
    cmp eax, 2
    jle short loc_0486
    mov ebx, ecx
    add ebx, ebx
    sbb eax, eax
    cmp eax, ebx
    adc al, 0
    mov ecx, eax
    jmp short loc_0488
loc_0486:
    xor ecx, ecx
loc_0488:
    lea eax, [ecx*4]
    sub dword [TOTALCLOCK], eax
    movsx eax, word [CONNECTHEAD]
    mov edi, dword [LINK_ADDRESS_36]
    mov ebx, dword [eax*4 + LINK_ADDRESS_31]
    add edi, ecx
    sub ebx, ecx
    mov dword [LINK_ADDRESS_36], edi
    mov dword [eax*4 + LINK_ADDRESS_31], ebx
loc_04ba:
    mov ax, word [MYCONNECTINDEX]
    mov di, word [CONNECTHEAD]
    cmp ax, di
    jne near loc_0532
    movsx ecx, di
    movsx ecx, word [nosplit ecx*2 + CONNECTPOINT2]
    jmp short loc_052e
loc_04dd:
    lea eax, [ecx*4]
    mov ebp, dword [eax + LINK_ADDRESS_31]
    cmp ebp, -0x80
    jle short loc_04f3
    mov eax, ebp
    jmp short loc_04f8
loc_04f3:
    mov eax, 0xffffff80
loc_04f8:
    cmp eax, 0x7f
    jge short loc_051a
    lea eax, [ecx*4]
    mov edx, dword [eax + LINK_ADDRESS_31]
    cmp edx, -0x80
    jle short loc_0513
    mov eax, edx
    jmp short loc_051f
loc_0513:
    mov eax, 0xffffff80
    jmp short loc_051f
loc_051a:
    mov eax, 0x7f
loc_051f:
    inc esi
    movsx ecx, word [nosplit ecx*2 + CONNECTPOINT2]
    mov byte [esi + LINK_ADDRESS_37], al
loc_052e:
    test ecx, ecx
    jge short loc_04dd
loc_0532:
    mov ebx, 0x7fffffff
    movsx ecx, word [CONNECTHEAD]
    jmp short loc_054f
loc_0540:
    mov dword [ecx*4 + LINK_ADDRESS_31], ebx
    movsx ecx, word [nosplit ecx*2 + CONNECTPOINT2]
loc_054f:
    test ecx, ecx
    jge short loc_0540
loc_0553:
    movsx edx, word [MYCONNECTINDEX]
    lea ebx, [edx*4]
    mov ecx, dword [ebx + LINK_ADDRESS_12]
    lea edi, [edx*4]
    sub ecx, 2
    mov ebx, dword [ebx + LINK_ADDRESS_12]
    and ecx, 0xff
    add edi, edx
    lea eax, [ecx*4]
    dec ebx
    add eax, ecx
    mov ecx, LINK_ADDRESS_26
    shl eax, 5
    and ebx, 0xff
    add ecx, eax
    lea eax, [ebx*4]
    add edi, edi
    add eax, ebx
    lea edx, [ecx + edi]
    shl eax, 5
    xor bl, bl
    add eax, LINK_ADDRESS_26
    mov byte [esi + LINK_ADDRESS_35], bl
    add edi, eax
    mov cx, word [edx + 2]
    mov eax, esi
    mov bx, word [edi + 2]
    inc esi
    cmp bx, cx
    je short loc_05f0
    mov bl, byte [edi + 2]
    mov byte [esi + LINK_ADDRESS_35], bl
    movsx ebx, word [edi + 2]
    sar ebx, 8
    mov byte [esi + LINK_ADDRESS_38], bl
    mov bh, byte [eax + LINK_ADDRESS_35]
    inc esi
    or bh, 1
    inc esi
    mov byte [eax + LINK_ADDRESS_35], bh
loc_05f0:
    mov bx, word [edi + 4]
    cmp bx, word [edx + 4]
    je short loc_0621
    mov bl, byte [edi + 4]
    mov byte [esi + LINK_ADDRESS_35], bl
    movsx ebx, word [edi + 4]
    sar ebx, 8
    mov byte [esi + LINK_ADDRESS_38], bl
    mov cl, byte [eax + LINK_ADDRESS_35]
    inc esi
    or cl, 2
    inc esi
    mov byte [eax + LINK_ADDRESS_35], cl
loc_0621:
    mov bl, byte [edi]
    cmp bl, byte [edx]
    je short loc_063d
    mov byte [esi + LINK_ADDRESS_35], bl
    mov bl, byte [eax + LINK_ADDRESS_35]
    or bl, 4
    inc esi
    mov byte [eax + LINK_ADDRESS_35], bl
loc_063d:
    mov ebx, dword [edi + 6]
    xor ebx, dword [edx + 6]
    test bl, 0xff
    je short loc_0661
    mov bl, byte [edi + 6]
    mov byte [esi + LINK_ADDRESS_35], bl
    mov bh, byte [eax + LINK_ADDRESS_35]
    or bh, 8
    inc esi
    mov byte [eax + LINK_ADDRESS_35], bh
loc_0661:
    mov ebx, dword [edi + 6]
    xor ebx, dword [edx + 6]
    test bh, 0xff
    je short loc_068e
    mov ebx, dword [edi + 6]
    shr ebx, 8
    and ebx, 0xff
    mov byte [esi + LINK_ADDRESS_35], bl
    mov cl, byte [eax + LINK_ADDRESS_35]
    or cl, 0x10
    inc esi
    mov byte [eax + LINK_ADDRESS_35], cl
loc_068e:
    mov ebx, dword [edi + 6]
    xor ebx, dword [edx + 6]
    test ebx, 0xff0000
    je short loc_06be
    mov ebx, dword [edi + 6]
    shr ebx, 0x10
    and ebx, 0xff
    mov byte [esi + LINK_ADDRESS_35], bl
    mov ch, byte [eax + LINK_ADDRESS_35]
    or ch, 0x20
    inc esi
    mov byte [eax + LINK_ADDRESS_35], ch
loc_06be:
    mov ebx, dword [edi + 6]
    xor ebx, dword [edx + 6]
    test ebx, 0xff000000
    je short loc_06ee
    mov ebx, dword [edi + 6]
    shr ebx, 0x18
    and ebx, 0xff
    mov byte [esi + LINK_ADDRESS_35], bl
    mov bl, byte [eax + LINK_ADDRESS_35]
    or bl, 0x40
    inc esi
    mov byte [eax + LINK_ADDRESS_35], bl
loc_06ee:
    mov bl, byte [edi + 1]
    cmp bl, byte [edx + 1]
    je short loc_070c
    mov byte [esi + LINK_ADDRESS_35], bl
    mov cl, byte [eax + LINK_ADDRESS_35]
    or cl, 0x80
    inc esi
    mov byte [eax + LINK_ADDRESS_35], cl
loc_070c:
    movsx ecx, word [MYCONNECTINDEX]
loc_0713:
    mov edx, dword [LINK_ADDRESS_39]
    cmp edx, dword [ecx*4 + LINK_ADDRESS_40]
    je short loc_074a
    mov ebx, dword [LINK_ADDRESS_39]
    mov eax, ecx
    and edx, 0xff
    inc esi
    shl eax, 8
    inc ebx
    mov al, byte [edx + eax + LINK_ADDRESS_41]
    mov dword [LINK_ADDRESS_39], ebx
    mov byte [esi + LINK_ADDRESS_37], al
    jmp short loc_0713
loc_074a:
    movsx ecx, word [CONNECTHEAD]
    test ecx, ecx
    jge short loc_075f
    add esp, 0x24
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
loc_075f:
    movsx eax, word [MYCONNECTINDEX]
    cmp ecx, eax
    je short loc_0778
    mov edx, LINK_ADDRESS_35
    mov ebx, esi
    mov eax, ecx
    call SENDPACKET
loc_0778:
    movsx ecx, word [nosplit ecx*2 + CONNECTPOINT2]
    test ecx, ecx
    jge short loc_075f
    add esp, 0x24
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
loc_078e:
    mov ax, word [MYCONNECTINDEX]
    mov bx, word [CONNECTHEAD]
    cmp ax, bx
    je near loc_0a47
    cwde
    mov eax, dword [eax*4 + LINK_ADDRESS_12]
    dec eax
    test al, 0x1f
    jne near loc_0843
    movsx ecx, bx
    mov edx, dword [LINK_ADDRESS_36]
    mov ecx, dword [ecx*4 + LINK_ADDRESS_31]
    sub ecx, edx
    mov eax, ecx
    test eax, eax
    jns short loc_07cf
    neg eax
loc_07cf:
    cmp eax, 8
    jle short loc_07d8
    sar ecx, 1
    jmp short loc_07f5
loc_07d8:
    mov eax, ecx
    test eax, eax
    jns short loc_07e0
    neg eax
loc_07e0:
    cmp eax, 2
    jle short loc_07f3
    mov ebx, ecx
    add ebx, ebx
    sbb eax, eax
    cmp eax, ebx
    adc al, 0
    mov ecx, eax
    jmp short loc_07f5
loc_07f3:
    xor ecx, ecx
loc_07f5:
    lea eax, [ecx*4]
    sub dword [TOTALCLOCK], eax
    mov ebp, 0x7fffffff
    mov edi, dword [LINK_ADDRESS_36]
    movsx edx, word [CONNECTHEAD]
    add edi, ecx
    mov esi, dword [edx*4 + LINK_ADDRESS_31]
    mov dword [LINK_ADDRESS_36], edi
    sub esi, ecx
    mov ecx, edx
    mov dword [edx*4 + LINK_ADDRESS_31], esi
    jmp short loc_083f
loc_0830:
    mov dword [ecx*4 + LINK_ADDRESS_31], ebp
    movsx ecx, word [nosplit ecx*2 + CONNECTPOINT2]
loc_083f:
    test ecx, ecx
    jge short loc_0830
loc_0843:
    mov dh, 1
    xor bl, bl
    mov byte [LINK_ADDRESS_35], dh
    movsx edx, word [MYCONNECTINDEX]
    mov byte [LINK_ADDRESS_38], bl
    lea ebx, [edx*4]
    mov esi, 2
    mov ecx, dword [ebx + LINK_ADDRESS_12]
    sub ecx, esi
    and ecx, 0xff
    mov ebx, dword [ebx + LINK_ADDRESS_12]
    lea eax, [ecx*4]
    dec ebx
    add eax, ecx
    mov ecx, LINK_ADDRESS_26
    shl eax, 5
    and ebx, 0xff
    add ecx, eax
    lea eax, [ebx*4]
    lea edi, [edx*4]
    add eax, ebx
    add edi, edx
    shl eax, 5
    add edi, edi
    add eax, LINK_ADDRESS_26
    lea edx, [ecx + edi]
    add edi, eax
    mov bx, word [edx + 2]
    cmp bx, word [edi + 2]
    je short loc_08e0
    mov al, byte [edi + 2]
    mov byte [LINK_ADDRESS_43], al
    mov bh, 1
    movsx eax, word [edi + 2]
    mov esi, 4
    sar eax, 8
    mov byte [LINK_ADDRESS_38], bh
    mov byte [LINK_ADDRESS_44], al
loc_08e0:
    mov ax, word [edi + 4]
    cmp ax, word [edx + 4]
    je short loc_0911
    mov al, byte [edi + 4]
    mov byte [esi + LINK_ADDRESS_35], al
    movsx eax, word [edi + 4]
    sar eax, 8
    mov byte [esi + LINK_ADDRESS_38], al
    mov cl, byte [LINK_ADDRESS_38]
    inc esi
    or cl, 2
    inc esi
    mov byte [LINK_ADDRESS_38], cl
loc_0911:
    mov al, byte [edi]
    cmp al, byte [edx]
    je short loc_092a
    mov byte [esi + LINK_ADDRESS_35], al
    mov al, byte [LINK_ADDRESS_38]
    or al, 4
    inc esi
    mov byte [LINK_ADDRESS_38], al
loc_092a:
    mov eax, dword [edi + 6]
    xor eax, dword [edx + 6]
    test al, 0xff
    je short loc_094d
    mov al, byte [edi + 6]
    mov byte [esi + LINK_ADDRESS_35], al
    mov ah, byte [LINK_ADDRESS_38]
    or ah, 8
    inc esi
    mov byte [LINK_ADDRESS_38], ah
loc_094d:
    mov eax, dword [edi + 6]
    xor eax, dword [edx + 6]
    test ah, 0xff
    je short loc_0979
    mov eax, dword [edi + 6]
    shr eax, 8
    and eax, 0xff
    mov byte [esi + LINK_ADDRESS_35], al
    mov bl, byte [LINK_ADDRESS_38]
    or bl, 0x10
    inc esi
    mov byte [LINK_ADDRESS_38], bl
loc_0979:
    mov eax, dword [edi + 6]
    xor eax, dword [edx + 6]
    test eax, 0xff0000
    je short loc_09a7
    mov eax, dword [edi + 6]
    shr eax, 0x10
    and eax, 0xff
    mov byte [esi + LINK_ADDRESS_35], al
    mov bh, byte [LINK_ADDRESS_38]
    or bh, 0x20
    inc esi
    mov byte [LINK_ADDRESS_38], bh
loc_09a7:
    mov eax, dword [edi + 6]
    xor eax, dword [edx + 6]
    test eax, 0xff000000
    je short loc_09d5
    mov eax, dword [edi + 6]
    shr eax, 0x18
    and eax, 0xff
    mov byte [esi + LINK_ADDRESS_35], al
    mov cl, byte [LINK_ADDRESS_38]
    or cl, 0x40
    inc esi
    mov byte [LINK_ADDRESS_38], cl
loc_09d5:
    mov al, byte [edi + 1]
    cmp al, byte [edx + 1]
    je short loc_09f0
    mov byte [esi + LINK_ADDRESS_35], al
    mov al, byte [LINK_ADDRESS_38]
    or al, 0x80
    inc esi
    mov byte [LINK_ADDRESS_38], al
loc_09f0:
    movsx eax, word [MYCONNECTINDEX]
    mov ecx, dword [LINK_ADDRESS_39]
    cmp ecx, dword [eax*4 + LINK_ADDRESS_40]
    je short loc_0a2a
    mov edx, ecx
    shl eax, 8
    and edx, 0xff
    inc esi
    lea edi, [ecx + 1]
    mov al, byte [edx + eax + LINK_ADDRESS_41]
    mov dword [LINK_ADDRESS_39], edi
    mov byte [esi + LINK_ADDRESS_37], al
    jmp short loc_09f0
loc_0a2a:
    mov edx, LINK_ADDRESS_35
    movsx eax, word [CONNECTHEAD]
    mov ebx, esi
    call SENDPACKET
    add esp, 0x24
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
loc_0a47:
    mov edi, dword [LINK_ADDRESS_45]
    movsx ecx, bx
    jmp short loc_0aa3
loc_0a52:
    cmp edi, dword [ecx*4 + LINK_ADDRESS_12]
    jl short loc_0a9b
    mov dl, 0x7f
    movsx eax, word [CONNECTHEAD]
    mov byte [LINK_ADDRESS_35], dl
    movsx ecx, word [nosplit eax*2 + CONNECTPOINT2]
    jmp short loc_0a8d
loc_0a74:
    mov ebx, 1
    mov edx, LINK_ADDRESS_35
    mov eax, ecx
    call SENDPACKET
    movsx ecx, word [nosplit ecx*2 + CONNECTPOINT2]
loc_0a8d:
    test ecx, ecx
    jge short loc_0a74
    add esp, 0x24
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
loc_0a9b:
    movsx ecx, word [nosplit ecx*2 + CONNECTPOINT2]
loc_0aa3:
    test ecx, ecx
    jge short loc_0a52
    movsx ecx, word [CONNECTHEAD]
    mov ebp, dword [LINK_ADDRESS_45]
    jmp short loc_0ad4
loc_0ab6:
    cmp byte [ecx + LINK_ADDRESS_46], 0
    je short loc_0acc
    cmp ebp, dword [ecx*4 + LINK_ADDRESS_12]
    jge near loc_01e5
loc_0acc:
    movsx ecx, word [nosplit ecx*2 + CONNECTPOINT2]
loc_0ad4:
    test ecx, ecx
    jge short loc_0ab6
    mov edx, dword [LINK_ADDRESS_45]
    dec edx
    and edx, 0xff
    lea eax, [edx*4]
    mov ebx, dword [LINK_ADDRESS_45]
    add eax, edx
    mov edx, LINK_ADDRESS_26
    shl eax, 5
    and ebx, 0xff
    add edx, eax
    lea eax, [ebx*4]
    mov edi, LINK_ADDRESS_26
    add eax, ebx
    mov esi, 1
    shl eax, 5
    xor ch, ch
    add edi, eax
    mov al, byte [LINK_ADDRESS_45]
    mov byte [LINK_ADDRESS_35], ch
    test al, 0x1f
    jne near loc_0bc1
    movsx eax, word [CONNECTHEAD]
    movsx ecx, word [nosplit eax*2 + CONNECTPOINT2]
    jmp short loc_0b9c
loc_0b42:
    cmp byte [ecx + LINK_ADDRESS_46], 0
    je short loc_0b94
    lea eax, [ecx*4]
    mov ebx, dword [eax + LINK_ADDRESS_31]
    cmp ebx, -0x80
    jle short loc_0b61
    mov eax, ebx
    jmp short loc_0b66
loc_0b61:
    mov eax, 0xffffff80
loc_0b66:
    cmp eax, 0x7f
    jge short loc_0b88
    lea eax, [ecx*4]
    mov ebp, dword [eax + LINK_ADDRESS_31]
    cmp ebp, -0x80
    jle short loc_0b81
    mov eax, ebp
    jmp short loc_0b8d
loc_0b81:
    mov eax, 0xffffff80
    jmp short loc_0b8d
loc_0b88:
    mov eax, 0x7f
loc_0b8d:
    inc esi
    mov byte [esi + LINK_ADDRESS_37], al
loc_0b94:
    movsx ecx, word [nosplit ecx*2 + CONNECTPOINT2]
loc_0b9c:
    test ecx, ecx
    jge short loc_0b42
    mov eax, 0x7fffffff
    movsx ecx, word [CONNECTHEAD]
    jmp short loc_0bbd
loc_0bae:
    mov dword [ecx*4 + LINK_ADDRESS_31], eax
    movsx ecx, word [nosplit ecx*2 + CONNECTPOINT2]
loc_0bbd:
    test ecx, ecx
    jge short loc_0bae
loc_0bc1:
    movsx ecx, word [CONNECTHEAD]
    mov eax, esi
    test ecx, ecx
    jge short loc_0bda
    movsx ecx, word [CONNECTHEAD]
    jmp near loc_0eb1
loc_0bda:
    xor ebx, ebx
    mov bl, byte [ecx + LINK_ADDRESS_46]
    movsx ecx, word [nosplit ecx*2 + CONNECTPOINT2]
    add esi, ebx
    test ecx, ecx
    jge short loc_0bda
    movsx ecx, word [CONNECTHEAD]
    jmp near loc_0eb1
loc_0bfc:
    cmp byte [ecx + LINK_ADDRESS_46], 0
    je near loc_0ea9
    xor bl, bl
    mov byte [eax + LINK_ADDRESS_35], bl
    lea ebx, [ecx*4]
    add ebx, ecx
    add ebx, ebx
    lea ebp, [edi + ebx]
    mov dword [esp], ebp
    lea ebp, [edx + ebx]
    mov ebx, dword [esp]
    mov bx, word [ebx + 2]
    cmp bx, word [ebp + 2]
    je short loc_0c67
    mov ebx, dword [esp]
    mov bl, byte [ebx + 2]
    mov byte [esi + LINK_ADDRESS_35], bl
    mov ebx, dword [esp]
    movsx ebx, word [ebx + 2]
    sar ebx, 8
    mov dword [esp + 0x20], ebx
    mov bl, byte [esp + 0x20]
    mov byte [esi + LINK_ADDRESS_38], bl
    mov bh, byte [eax + LINK_ADDRESS_35]
    inc esi
    or bh, 1
    inc esi
    mov byte [eax + LINK_ADDRESS_35], bh
loc_0c67:
    lea ebx, [ecx*4]
    add ebx, ecx
    add ebx, ebx
    lea ebp, [edi + ebx]
    mov dword [esp + 0x1c], ebp
    lea ebp, [edx + ebx]
    mov ebx, dword [esp + 0x1c]
    mov bx, word [ebx + 4]
    cmp bx, word [ebp + 4]
    je short loc_0cc1
    mov ebx, dword [esp + 0x1c]
    mov bl, byte [ebx + 4]
    mov byte [esi + LINK_ADDRESS_35], bl
    mov ebx, dword [esp + 0x1c]
    movsx ebx, word [ebx + 4]
    sar ebx, 8
    mov dword [esp + 0x20], ebx
    mov bl, byte [esp + 0x20]
    mov byte [esi + LINK_ADDRESS_38], bl
    mov bl, byte [eax + LINK_ADDRESS_35]
    inc esi
    or bl, 2
    inc esi
    mov byte [eax + LINK_ADDRESS_35], bl
loc_0cc1:
    lea ebx, [ecx*4]
    add ebx, ecx
    add ebx, ebx
    lea ebp, [edi + ebx]
    mov dword [esp + 0x10], ebp
    lea ebp, [edx + ebx]
    mov ebx, dword [esp + 0x10]
    mov bl, byte [ebx]
    mov bh, byte [ebp]
    cmp bl, bh
    je short loc_0cff
    mov ebx, dword [esp + 0x10]
    mov bl, byte [ebx]
    mov byte [esi + LINK_ADDRESS_35], bl
    mov bl, byte [eax + LINK_ADDRESS_35]
    or bl, 4
    inc esi
    mov byte [eax + LINK_ADDRESS_35], bl
loc_0cff:
    lea ebx, [ecx*4]
    add ebx, ecx
    add ebx, ebx
    lea ebp, [edi + ebx]
    mov dword [esp + 0x18], ebp
    lea ebp, [edx + ebx]
    mov ebx, dword [esp + 0x18]
    mov ebx, dword [ebx + 6]
    mov dword [esp + 0x20], ebx
    mov ebx, dword [ebp + 6]
    mov ebp, dword [esp + 0x20]
    xor ebp, ebx
    mov ebx, ebp
    test bl, 0xff
    je short loc_0d4c
    mov ebx, dword [esp + 0x18]
    mov bl, byte [ebx + 6]
    mov byte [esi + LINK_ADDRESS_35], bl
    mov bh, byte [eax + LINK_ADDRESS_35]
    or bh, 8
    inc esi
    mov byte [eax + LINK_ADDRESS_35], bh
loc_0d4c:
    lea ebx, [ecx*4]
    add ebx, ecx
    add ebx, ebx
    lea ebp, [edi + ebx]
    mov dword [esp + 4], ebp
    lea ebp, [edx + ebx]
    mov ebx, dword [esp + 4]
    mov ebx, dword [ebx + 6]
    mov dword [esp + 0x20], ebx
    mov ebx, dword [ebp + 6]
    mov ebp, dword [esp + 0x20]
    xor ebp, ebx
    mov ebx, ebp
    test bh, 0xff
    je short loc_0daa
    mov ebx, dword [esp + 4]
    mov ebx, dword [ebx + 6]
    shr ebx, 8
    and ebx, 0xff
    mov dword [esp + 0x20], ebx
    mov bl, byte [esp + 0x20]
    mov byte [esi + LINK_ADDRESS_35], bl
    mov bl, byte [eax + LINK_ADDRESS_35]
    or bl, 0x10
    inc esi
    mov byte [eax + LINK_ADDRESS_35], bl
loc_0daa:
    lea ebx, [ecx*4]
    add ebx, ecx
    add ebx, ebx
    lea ebp, [edi + ebx]
    mov dword [esp + 8], ebp
    lea ebp, [edx + ebx]
    mov ebx, dword [esp + 8]
    mov ebx, dword [ebx + 6]
    mov dword [esp + 0x20], ebx
    mov ebx, dword [ebp + 6]
    mov ebp, dword [esp + 0x20]
    xor ebp, ebx
    test ebp, 0xff0000
    je short loc_0e09
    mov ebx, dword [esp + 8]
    mov ebx, dword [ebx + 6]
    shr ebx, 0x10
    and ebx, 0xff
    mov dword [esp + 0x20], ebx
    mov bl, byte [esp + 0x20]
    mov byte [esi + LINK_ADDRESS_35], bl
    mov bh, byte [eax + LINK_ADDRESS_35]
    or bh, 0x20
    inc esi
    mov byte [eax + LINK_ADDRESS_35], bh
loc_0e09:
    lea ebx, [ecx*4]
    add ebx, ecx
    add ebx, ebx
    lea ebp, [edi + ebx]
    mov dword [esp + 0x14], ebp
    lea ebp, [edx + ebx]
    mov ebx, dword [esp + 0x14]
    mov ebx, dword [ebx + 6]
    mov dword [esp + 0x20], ebx
    mov ebx, dword [ebp + 6]
    mov ebp, dword [esp + 0x20]
    xor ebp, ebx
    test ebp, 0xff000000
    je short loc_0e68
    mov ebx, dword [esp + 0x14]
    mov ebx, dword [ebx + 6]
    shr ebx, 0x18
    and ebx, 0xff
    mov dword [esp + 0x20], ebx
    mov bl, byte [esp + 0x20]
    mov byte [esi + LINK_ADDRESS_35], bl
    mov bl, byte [eax + LINK_ADDRESS_35]
    or bl, 0x40
    inc esi
    mov byte [eax + LINK_ADDRESS_35], bl
loc_0e68:
    lea ebx, [ecx*4]
    add ebx, ecx
    add ebx, ebx
    lea ebp, [edi + ebx]
    mov dword [esp + 0xc], ebp
    lea ebp, [edx + ebx]
    mov ebx, dword [esp + 0xc]
    mov bl, byte [ebx + 1]
    mov bh, byte [ebp + 1]
    cmp bl, bh
    je short loc_0ea8
    mov ebx, dword [esp + 0xc]
    mov bl, byte [ebx + 1]
    mov byte [esi + LINK_ADDRESS_35], bl
    mov bl, byte [eax + LINK_ADDRESS_35]
    or bl, 0x80
    inc esi
    mov byte [eax + LINK_ADDRESS_35], bl
loc_0ea8:
    inc eax
loc_0ea9:
    movsx ecx, word [nosplit ecx*2 + CONNECTPOINT2]
loc_0eb1:
    test ecx, ecx
    jge near loc_0bfc
loc_0eb9:
    movsx ecx, word [MYCONNECTINDEX]
    mov edx, dword [LINK_ADDRESS_39]
    cmp edx, dword [ecx*4 + LINK_ADDRESS_40]
    je short loc_0ef2
    mov eax, edx
    shl ecx, 8
    and eax, 0xff
    inc esi
    lea ebx, [edx + 1]
    mov al, byte [ecx + eax + LINK_ADDRESS_41]
    mov dword [LINK_ADDRESS_39], ebx
    mov byte [esi + LINK_ADDRESS_37], al
    jmp short loc_0eb9
loc_0ef2:
    movsx eax, word [CONNECTHEAD]
    movsx ecx, word [nosplit eax*2 + CONNECTPOINT2]
    jmp short loc_0f3a
loc_0f03:
    cmp byte [ecx + LINK_ADDRESS_46], 0
    je short loc_0f32
    mov edx, LINK_ADDRESS_35
    mov ebx, esi
    mov eax, ecx
    call SENDPACKET
    lea eax, [ecx*4]
    add eax, ecx
    test byte [edi + eax*2 + 9], 4
    je short loc_0f32
    xor dh, dh
    mov byte [ecx + LINK_ADDRESS_46], dh
loc_0f32:
    movsx ecx, word [nosplit ecx*2 + CONNECTPOINT2]
loc_0f3a:
    test ecx, ecx
    jge short loc_0f03
    xor eax, eax
    mov ecx, dword [LINK_ADDRESS_45]
    mov al, byte [LINK_ADDRESS_23]
    add ecx, eax
    mov dword [LINK_ADDRESS_45], ecx
    movsx ecx, word [CONNECTHEAD]
    mov ebp, dword [LINK_ADDRESS_45]
    jmp near loc_0ad4
    lea eax, [dword eax + 0]
    lea edx, [byte edx + 0]
    db 0x8b, 0xdb    ; mov ebx, ebx
    push ebx
    push ecx
    push edx
    push esi
    push edi
    sub esp, 4
    xor edi, edi
    xor esi, esi
    jmp short loc_0fde
loc_0f7e:
    lea eax, [edx*4]
    sub eax, edx
    lea eax, [eax*4]
    mov ebx, dword [eax + LINK_ADDRESS_47]
    mov cl, byte [ebx]
    cmp cl, 0xc8
    jb short loc_0fdd
    mov bl, cl
    and ebx, 0xff
    push ebx
    mov ecx, dword [eax + LINK_ADDRESS_48]
    push ecx
    push edx
    push 0xfc
    push LINK_ADDRESS_49
    call SPRINTF
    add esp, 0x14
    mov ebx, 0x1f
    mov ecx, 0xffffffff
    push 1
    movsx edx, di
    push LINK_ADDRESS_49
    xor eax, eax
    mov edi, dword [esp + 8]
    call LINK_ADDRESS_51
loc_0fdd:
    inc esi
loc_0fde:
    mov eax, edi
    mov ebx, dword [CACNUM]
    db 0x05, 0x06, 0x00, 0x00, 0x00    ; add eax, 6
    movsx edx, si
    mov dword [esp], eax
    cmp edx, ebx
    jl short loc_0f7e
    mov esi, 1
    mov edi, eax
    cmp si, 0xb
    jl short loc_100b
    add esp, 4
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
loc_100b:
    movsx eax, si
    cmp byte [eax + LINK_ADDRESS_53], 0xc8
    jb short loc_1048
    push eax
    push 0x11c
    push LINK_ADDRESS_49
    call SPRINTF
    add esp, 0xc
    mov ecx, 0xffffffff
    mov ebx, 0x1f
    push 1
    movsx edx, di
    push LINK_ADDRESS_49
    xor eax, eax
    add edi, 6
    call LINK_ADDRESS_51
loc_1048:
    inc esi
    cmp si, 0xb
    jl short loc_100b
    add esp, 4
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    lea eax, [dword eax + 0]
    db 0x8b, 0xd2    ; mov edx, edx
