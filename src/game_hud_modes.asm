; HUD drawing and display mode handling.
bits 32
org START_ADDRESS

    db 0x8d, 0x80, 0x00, 0x00, 0x00, 0x00    ; lea eax, [eax]
    db 0x8b, 0xd2    ; mov edx, edx
    push ebx
    push ecx
    push edx
    push esi
    push edi
    push ebp
    sub esp, 4
    movsx edx, word [MYCONNECTINDEX]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    add eax, eax
    mov dl, byte [eax + LINK_ADDRESS_2]
    test dl, 0x10
    jne near loc_10c1
    test dl, 1
    jne near loc_10c1
    mov dx, word [eax + LINK_ADDRESS_3]
    cmp dx, 1
    jne near loc_0fe8
loc_0053:
    call LINK_ADDRESS_4
    test eax, eax
    je near loc_10c1
    xor edx, edx
    call LINK_ADDRESS_5
    mov dl, al
    mov word [esp], dx
    and eax, 0xff
    call TOLOWER
    mov word [esp], ax
    db 0x66, 0x3d, 0x61, 0x00    ; cmp ax, 0x61
    jl short loc_0087
    db 0x66, 0x3d, 0x7a, 0x00    ; cmp ax, 0x7a
    jle short loc_00bc
loc_0087:
    mov esi, dword [esp]
    cmp si, 0x30
    jl short loc_0096
    cmp si, 0x39
    jle short loc_00bc
loc_0096:
    movsx edx, word [MYCONNECTINDEX]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    xor edx, edx
    mov word [nosplit eax*2 + LINK_ADDRESS_3], dx
    jmp near loc_10c1
loc_00bc:
    mov al, byte [LINK_ADDRESS_7]
    xor edx, edx
    mov dl, al
    mov ah, byte [esp]
    mov byte [edx + LINK_ADDRESS_8], ah
    inc al
    mov byte [LINK_ADDRESS_7], al
    xor eax, eax
    mov al, byte [LINK_ADDRESS_7]
    xor dl, dl
    mov byte [eax + LINK_ADDRESS_8], dl
    cmp al, 0xb
    jbe short loc_0113
    movsx edx, word [MYCONNECTINDEX]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    xor ebx, ebx
    mov word [nosplit eax*2 + LINK_ADDRESS_3], bx
    add esp, 4
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
loc_0113:
    mov edi, dword [esp]
    xor esi, esi
    jmp near loc_0191
loc_011d:
    xor ecx, ecx
    jmp short loc_0184
loc_0121:
    movsx edx, si
    lea eax, [edx*8]
    sub eax, edx
    movsx edx, cx
    add eax, eax
    add eax, edx
    mov dl, byte [edx + LINK_ADDRESS_8]
    mov bl, byte [eax + LINK_ADDRESS_9]
    cmp dl, bl
    je short loc_0155
    cmp bl, 0x23
    jne short loc_0190
    cmp di, 0x30
    jl short loc_0190
    cmp di, 0x39
    jg short loc_0190
loc_0155:
    movsx edx, si
    lea eax, [edx*8]
    sub eax, edx
    lea edx, [eax + eax]
    movsx eax, cx
    mov bl, byte [edx + eax + LINK_ADDRESS_10]
    test bl, bl
    je short loc_01c2
    xor edx, edx
    mov dl, byte [LINK_ADDRESS_7]
    dec edx
    cmp eax, edx
    je near loc_10c1
    inc ecx
loc_0184:
    xor eax, eax
    mov al, byte [LINK_ADDRESS_7]
    cmp cx, ax
    jl short loc_0121
loc_0190:
    inc esi
loc_0191:
    cmp si, 0x1a
    jl short loc_011d
    movsx edx, word [MYCONNECTINDEX]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    xor ecx, ecx
    mov word [nosplit eax*2 + LINK_ADDRESS_3], cx
    add esp, 4
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
loc_01c2:
    cmp si, 0x19
    ja near loc_0053
    xor eax, eax
    mov ax, si
    jmp dword cs:[eax*4 + LINK_ADDRESS_11]
%if GAME_UPDATE
    mov esi, 9
%else
    mov esi, 6
%endif
    xor ecx, ecx
    jmp short loc_0232
loc_01e2:
    movsx edx, word [MYCONNECTINDEX]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    mov edx, LINK_ADDRESS_12
    add eax, eax
    movsx ebx, word [edi*4 + LINK_ADDRESS_13]
    add edx, eax
    mov eax, edi
    call LINK_ADDRESS_14
    movsx edx, word [MYCONNECTINDEX]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    mov dh, 1
    inc esi
    mov byte [edi + eax*2 + LINK_ADDRESS_15], dh
loc_0232:
    mov edx, 0x11
    movsx eax, cx
    movsx edi, si
    sub edx, eax
    cmp edi, edx
    jl short loc_01e2
    call LINK_ADDRESS_16
    movsx edx, word [MYCONNECTINDEX]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    add eax, eax
    xor edx, edx
    mov word [eax + LINK_ADDRESS_3], dx
    mov edx, LINK_ADDRESS_12
    add edx, eax
    mov eax, 0x77
    call LINK_ADDRESS_17
    add esp, 4
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    call LINK_ADDRESS_16
    movsx edx, word [MYCONNECTINDEX]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    add eax, eax
    xor esi, esi
    mov edi, 0x190
    mov word [eax + LINK_ADDRESS_3], si
    mov edx, 0x4b0
    mov word [eax + LINK_ADDRESS_18], di
    mov ebx, 0xc8
    mov word [eax + LINK_ADDRESS_19], dx
    mov ecx, 0x64
    mov word [eax + LINK_ADDRESS_20], bx
    mov word [eax + LINK_ADDRESS_21], cx
    mov esi, 0x1900
    mov edx, 0x640
    mov word [eax + LINK_ADDRESS_22], si
    mov word [eax + LINK_ADDRESS_23], dx
    mov dx, word [LINK_ADDRESS_24]
    mov edi, 0x960
    mov word [eax + LINK_ADDRESS_25], dx
    mov edx, LINK_ADDRESS_12
    mov word [eax + LINK_ADDRESS_26], di
    add edx, eax
    mov eax, 0x78
    call LINK_ADDRESS_17
    movsx edx, word [MYCONNECTINDEX]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    xor ebx, ebx
    mov word [nosplit eax*2 + LINK_ADDRESS_3], bx
    add esp, 4
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    movsx edx, word [MYCONNECTINDEX]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    mov word [nosplit eax*2 + LINK_ADDRESS_27], 7
    call LINK_ADDRESS_16
    movsx edx, word [MYCONNECTINDEX]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    mov edx, LINK_ADDRESS_12
    add eax, eax
    xor ecx, ecx
    add edx, eax
    mov word [eax + LINK_ADDRESS_3], cx
    mov eax, 0x79
    call LINK_ADDRESS_17
    add esp, 4
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    mov al, 1
    mov bh, byte [LINK_ADDRESS_28]
    sub al, bh
    mov byte [LINK_ADDRESS_28], al
    call LINK_ADDRESS_16
    movsx edx, word [MYCONNECTINDEX]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    xor edx, edx
    mov word [nosplit eax*2 + LINK_ADDRESS_3], dx
    jmp near loc_0053
    mov al, 1
    mov cl, byte [LINK_ADDRESS_29]
    sub al, cl
    mov byte [LINK_ADDRESS_29], al
    call LINK_ADDRESS_16
    movsx edx, word [MYCONNECTINDEX]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    mov edx, LINK_ADDRESS_12
    add eax, eax
    xor ecx, ecx
    add edx, eax
    mov word [eax + LINK_ADDRESS_3], cx
    xor eax, eax
    mov al, byte [LINK_ADDRESS_29]
    db 0x05, 0x70, 0x00, 0x00, 0x00    ; add eax, 0x70
    cwde
    call LINK_ADDRESS_17
    add esp, 4
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    movsx edx, word [MYCONNECTINDEX]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    mov byte [nosplit eax*2 + LINK_ADDRESS_2], 8
    xor edx, edx
    mov word [nosplit eax*2 + LINK_ADDRESS_3], dx
    call LINK_ADDRESS_16
    add esp, 4
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    movsx edx, word [MYCONNECTINDEX]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    mov edx, LINK_ADDRESS_12
    add eax, eax
    add edx, eax
    mov eax, 0x4f
    call LINK_ADDRESS_17
    movsx edx, word [MYCONNECTINDEX]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    xor esi, esi
    mov word [nosplit eax*2 + LINK_ADDRESS_3], si
    mov byte [LINK_ADDRESS_30], bl
    add esp, 4
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    mov al, 1
    mov cl, byte [LINK_ADDRESS_31]
    sub al, cl
    mov byte [LINK_ADDRESS_31], al
    je near loc_0586
    movsx edx, word [MYCONNECTINDEX]
    mov edi, edx
    shl edi, 7
    sub edi, edx
    lea edi, [edi*4]
    sub edi, edx
    add edi, edi
    movsx ebx, word [edi + LINK_ADDRESS_32]
    imul edx, ebx, 0x2c
    mov ah, 1
    mov byte [LINK_ADDRESS_33], ah
    mov byte [LINK_ADDRESS_34], ah
    mov word [edx + LINK_ADDRESS_35], 0x101
    lea eax, [ebx*8]
    add eax, ebx
    lea eax, [eax*8]
    sub eax, ebx
    xor ebp, ebp
    mov dword [eax + LINK_ADDRESS_36], ebp
    mov dword [eax + LINK_ADDRESS_37], ebp
    mov dword [eax + LINK_ADDRESS_38], ebp
    xor ecx, ecx
    mov dword [eax + LINK_ADDRESS_39], ebp
    mov word [edx + LINK_ADDRESS_40], cx
    mov dword [eax + LINK_ADDRESS_41], ebp
    xor ebx, ebx
    mov dword [eax + LINK_ADDRESS_42], ebp
    mov al, byte [edi + LINK_ADDRESS_43]
    mov word [edx + LINK_ADDRESS_44], bx
    mov byte [edx + LINK_ADDRESS_45], al
    mov edx, LINK_ADDRESS_12
    mov eax, 0x11
    add edx, edi
    jmp short loc_05ed
loc_0586:
    movsx edx, word [MYCONNECTINDEX]
    mov ebx, edx
    shl ebx, 7
    sub ebx, edx
    lea ebx, [ebx*4]
    sub ebx, edx
    add ebx, ebx
    movsx edx, word [ebx + LINK_ADDRESS_32]
    imul edi, edx, 0x2c
    mov ax, word [LINK_ADDRESS_24]
    mov word [edi + LINK_ADDRESS_46], ax
    lea eax, [edx*8]
    add eax, edx
    lea eax, [eax*8]
    sub eax, edx
    mov esi, 0xffffffff
    mov edx, LINK_ADDRESS_12
    mov word [eax + LINK_ADDRESS_47], si
    mov ax, word [LINK_ADDRESS_24]
    add edx, ebx
    mov word [ebx + LINK_ADDRESS_48], ax
    mov eax, 0x12
loc_05ed:
    call LINK_ADDRESS_17
    movsx edx, word [MYCONNECTINDEX]
    mov ebx, edx
    shl ebx, 7
    sub ebx, edx
    lea ebx, [ebx*4]
    sub ebx, edx
    add ebx, ebx
    movsx edx, word [ebx + LINK_ADDRESS_32]
    imul edi, edx, 0x2c
    mov ax, word [LINK_ADDRESS_24]
    mov word [edi + LINK_ADDRESS_46], ax
    lea eax, [edx*8]
    add eax, edx
    lea eax, [eax*8]
    xor esi, esi
    sub eax, edx
    mov word [ebx + LINK_ADDRESS_3], si
    mov word [eax + LINK_ADDRESS_47], si
    call LINK_ADDRESS_16
    add esp, 4
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
%if GAME_UPDATE
    mov esi, 9
%else
    mov esi, 6
%endif
    xor ecx, ecx
    jmp short loc_067d
loc_065c:
    movsx edx, word [MYCONNECTINDEX]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    mov dl, 1
    inc esi
    mov byte [ebx + eax*2 + LINK_ADDRESS_15], dl
loc_067d:
    mov edx, 0x11
    movsx eax, cx
    movsx ebx, si
    sub edx, eax
    cmp ebx, edx
    jl short loc_065c
%if GAME_UPDATE
    mov esi, 9
%else
    mov esi, 6
%endif
    jmp short loc_06c5
loc_0695:
    movsx edx, word [MYCONNECTINDEX]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    mov edx, LINK_ADDRESS_12
    add eax, eax
    movsx ebx, word [edi*4 + LINK_ADDRESS_13]
    add edx, eax
    mov eax, edi
    inc esi
    call LINK_ADDRESS_14
loc_06c5:
    mov edx, 0x11
    movsx eax, cx
    movsx edi, si
    sub edx, eax
    cmp edi, edx
    jl short loc_0695
    movsx edx, word [MYCONNECTINDEX]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    add eax, eax
    mov edi, 0x32
    mov edx, 0x190
    mov word [eax + LINK_ADDRESS_49], di
    mov ebx, 0x4b0
    mov word [eax + LINK_ADDRESS_18], dx
    mov ecx, 0xc8
    mov word [eax + LINK_ADDRESS_19], bx
    mov esi, 0x64
    mov word [eax + LINK_ADDRESS_20], cx
    mov word [eax + LINK_ADDRESS_21], si
    mov edi, 0x1900
    mov edx, 0x960
    mov word [eax + LINK_ADDRESS_22], di
    mov ebx, 0x640
    mov word [eax + LINK_ADDRESS_26], dx
    mov word [eax + LINK_ADDRESS_23], bx
    mov dx, word [LINK_ADDRESS_24]
    mov ecx, 7
    mov word [eax + LINK_ADDRESS_25], dx
    mov edx, LINK_ADDRESS_12
    mov word [eax + LINK_ADDRESS_27], cx
    add edx, eax
    mov eax, 5
    call LINK_ADDRESS_17
    movsx edx, word [MYCONNECTINDEX]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    xor esi, esi
    mov word [nosplit eax*2 + LINK_ADDRESS_3], si
    call LINK_ADDRESS_16
    movsx edx, word [MYCONNECTINDEX]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    mov byte [nosplit eax*2 + LINK_ADDRESS_50], 1
    add esp, 4
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    cmp si, 2
    jne near loc_08bb
    xor edx, edx
    mov dl, byte [LINK_ADDRESS_51]
    sub edx, 0x30
    imul ebx, edx, 0xa
    xor edx, edx
    xor eax, eax
    mov dl, byte [LINK_ADDRESS_52]
    mov al, byte [LINK_ADDRESS_53]
    sub edx, 0x30
    sub eax, 0x30
    add edx, ebx
    dec eax
    dec edx
    db 0x66, 0x3d, 0x04, 0x00    ; cmp ax, 4
    jle short loc_0830
    movsx edx, word [MYCONNECTINDEX]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    xor ecx, ecx
    mov word [nosplit eax*2 + LINK_ADDRESS_3], cx
    call LINK_ADDRESS_16
    add esp, 4
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
loc_0830:
    test ax, ax
    jne short loc_086b
    cmp dx, 5
    jle short loc_08a1
    movsx edx, word [MYCONNECTINDEX]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    xor ebx, ebx
    mov word [nosplit eax*2 + LINK_ADDRESS_3], bx
    call LINK_ADDRESS_16
    add esp, 4
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
loc_086b:
    cmp dx, 0xb
    jl short loc_08a1
    movsx edx, word [MYCONNECTINDEX]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    xor esi, esi
    mov word [nosplit eax*2 + LINK_ADDRESS_3], si
    call LINK_ADDRESS_16
    add esp, 4
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
loc_08a1:
    cwde
    mov dword [LINK_ADDRESS_54], eax
    mov dword [LINK_ADDRESS_55], eax
    movsx eax, dx
    mov dword [LINK_ADDRESS_56], eax
    mov dword [LINK_ADDRESS_57], eax
    jmp short loc_08cf
loc_08bb:
    xor eax, eax
    mov al, byte [LINK_ADDRESS_58]
    sub eax, 0x31
    mov dword [LINK_ADDRESS_59], eax
    mov dword [LINK_ADDRESS_60], eax
loc_08cf:
    cmp word [NUMPLAYERS], 1
    jle near loc_098b
    mov ax, word [MYCONNECTINDEX]
    mov dx, word [CONNECTHEAD]
    cmp ax, dx
    jne near loc_098b
    mov al, byte [LINK_ADDRESS_57]
    mov byte [LINK_ADDRESS_63], al
    mov al, byte [LINK_ADDRESS_55]
    mov byte [LINK_ADDRESS_64], al
    mov al, byte [LINK_ADDRESS_60]
    mov byte [LINK_ADDRESS_65], al
    mov al, byte [LINK_ADDRESS_66]
    mov byte [LINK_ADDRESS_67], al
    mov al, byte [LINK_ADDRESS_68]
    mov byte [LINK_ADDRESS_69], al
    mov al, byte [LINK_ADDRESS_70]
    mov byte [LINK_ADDRESS_71], al
    mov al, byte [LINK_ADDRESS_72]
    mov byte [LINK_ADDRESS_73], al
    mov al, byte [LINK_ADDRESS_74]
    mov bh, 5
    mov byte [LINK_ADDRESS_75], al
    mov al, byte [LINK_ADDRESS_76]
    mov byte [LINK_ADDRESS_77], bh
    mov byte [LINK_ADDRESS_78], al
    mov al, byte [LINK_ADDRESS_79]
    mov ebx, edx
    mov byte [LINK_ADDRESS_80], al
    test bx, bx
    jge short loc_0968
    jmp short loc_09aa
loc_0968:
    mov edx, LINK_ADDRESS_77
    movsx edi, bx
    mov ebx, 0xb
    mov eax, edi
    call SENDPACKET
    mov bx, word [nosplit edi*2 + CONNECTPOINT2]
    test bx, bx
    jge short loc_0968
    jmp short loc_09aa
loc_098b:
    movsx edx, word [MYCONNECTINDEX]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    or byte [nosplit eax*2 + LINK_ADDRESS_2], 0x20
loc_09aa:
    movsx edx, word [MYCONNECTINDEX]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    xor esi, esi
    mov word [nosplit eax*2 + LINK_ADDRESS_3], si
    call LINK_ADDRESS_16
    add esp, 4
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    movsx edx, word [MYCONNECTINDEX]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    xor ecx, ecx
    mov edi, dword [LINK_ADDRESS_83]
    mov word [nosplit eax*2 + LINK_ADDRESS_3], cx
    mov eax, 1
    sub eax, edi
    mov dword [LINK_ADDRESS_83], eax
    call LINK_ADDRESS_16
    add esp, 4
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    movsx edx, word [MYCONNECTINDEX]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    add eax, eax
    cmp word [eax + LINK_ADDRESS_84], 0
    je short loc_0a4a
    xor edx, edx
    mov word [eax + LINK_ADDRESS_84], dx
    jmp short loc_0a68
loc_0a4a:
    xor esi, esi
    mov edi, 1
    mov dword [LINK_ADDRESS_85], esi
    mov word [eax + LINK_ADDRESS_84], di
    mov eax, dword [TOTALCLOCK]
    mov dword [LINK_ADDRESS_87], eax
loc_0a68:
    movsx edx, word [MYCONNECTINDEX]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    mov edx, LINK_ADDRESS_12
    add eax, eax
    add edx, eax
    mov eax, 0x16
    call LINK_ADDRESS_17
    movsx edx, word [MYCONNECTINDEX]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    xor ebx, ebx
    mov word [nosplit eax*2 + LINK_ADDRESS_3], bx
    call LINK_ADDRESS_16
    add esp, 4
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    movsx edx, word [MYCONNECTINDEX]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    mov edx, LINK_ADDRESS_12
    add eax, eax
    add edx, eax
    mov eax, 0x15
    call LINK_ADDRESS_17
    movsx edx, word [MYCONNECTINDEX]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    xor ecx, ecx
    mov word [nosplit eax*2 + LINK_ADDRESS_3], cx
    call LINK_ADDRESS_16
    add esp, 4
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    mov bx, word [NUMSECTORS]
    jmp near loc_0b96
loc_0b28:
    movsx edx, bx
    lea eax, [edx*4]
    add edx, eax
    lea edx, [edx*8]
    mov cx, word [edx + LINK_ADDRESS_89]
    movsx eax, cx
    cmp eax, -1
    je short loc_0b96
    cmp cx, 0x7fff
    je short loc_0b96
    mov esi, ecx
    and esi, 0x7fff
    cmp si, 2
    jle short loc_0b96
    test ax, 0xbfff
    je short loc_0b6f
    and ch, 0xbf
    mov word [edx + LINK_ADDRESS_89], cx
loc_0b6f:
    movsx edx, word [MYCONNECTINDEX]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    movsx edx, word [nosplit eax*2 + LINK_ADDRESS_32]
    movsx eax, bx
    call LINK_ADDRESS_90
loc_0b96:
    dec ebx
    test bx, bx
    jge short loc_0b28
    movsx edx, word [MYCONNECTINDEX]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    mov edx, 0xffffffff
    movsx eax, word [nosplit eax*2 + LINK_ADDRESS_32]
    call LINK_ADDRESS_91
    movsx edx, word [MYCONNECTINDEX]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    mov edx, LINK_ADDRESS_12
    add eax, eax
    add edx, eax
    mov eax, 0x64
    call LINK_ADDRESS_17
    movsx edx, word [MYCONNECTINDEX]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    xor ecx, ecx
    mov word [nosplit eax*2 + LINK_ADDRESS_3], cx
    call LINK_ADDRESS_16
    add esp, 4
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    mov al, 1
    mov dl, byte [LINK_ADDRESS_92]
    sub al, dl
    mov byte [LINK_ADDRESS_92], al
    mov byte [LINK_ADDRESS_30], bl
    movsx edx, word [MYCONNECTINDEX]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    xor bh, bh
    mov word [nosplit eax*2 + LINK_ADDRESS_3], bx
    add esp, 4
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    movsx edx, word [MYCONNECTINDEX]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    add eax, eax
    mov ecx, 0x190
    mov esi, 0x4b0
    mov word [eax + LINK_ADDRESS_18], cx
    mov edi, 0xc8
    mov word [eax + LINK_ADDRESS_19], si
    mov edx, 0x64
    mov word [eax + LINK_ADDRESS_20], di
    mov ebx, 0x1900
    mov word [eax + LINK_ADDRESS_21], dx
    mov word [eax + LINK_ADDRESS_22], bx
    mov ecx, 0x960
    mov esi, 0x640
    mov word [eax + LINK_ADDRESS_26], cx
    mov dx, word [LINK_ADDRESS_24]
    mov word [eax + LINK_ADDRESS_23], si
    mov edi, 7
    mov word [eax + LINK_ADDRESS_25], dx
    mov edx, LINK_ADDRESS_12
    mov word [eax + LINK_ADDRESS_27], di
    add edx, eax
    mov eax, 5
    call LINK_ADDRESS_17
    movsx edx, word [MYCONNECTINDEX]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    xor edx, edx
    mov word [nosplit eax*2 + LINK_ADDRESS_3], dx
    call LINK_ADDRESS_16
    add esp, 4
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    mov al, 1
    mov ah, byte [LINK_ADDRESS_93]
    sub al, ah
    mov byte [LINK_ADDRESS_93], al
    je short loc_0d8d
    mov dl, 0xff
    xor bh, bh
    jmp short loc_0d48
loc_0d3e:
    movsx eax, bx
    inc ebx
    mov byte [eax + SHOW2DSECTOR], dl
loc_0d48:
    cmp bx, 0x80
    jl short loc_0d3e
    mov dh, 0xff
    xor ebx, ebx
    jmp short loc_0d5f
loc_0d55:
    movsx eax, bx
    inc ebx
    mov byte [eax + SHOW2DWALL], dh
loc_0d5f:
    cmp bx, 0x400
    jl short loc_0d55
    movsx edx, word [MYCONNECTINDEX]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    mov edx, LINK_ADDRESS_12
    add eax, eax
    add edx, eax
    mov eax, 0x6f
    jmp short loc_0de0
loc_0d8d:
    xor bh, bh
    jmp short loc_0d9d
loc_0d91:
    movsx eax, bx
    xor cl, cl
    inc ebx
    mov byte [eax + SHOW2DSECTOR], cl
loc_0d9d:
    cmp bx, 0x80
    jl short loc_0d91
    xor ebx, ebx
    jmp short loc_0db4
loc_0da8:
    movsx eax, bx
    xor ch, ch
    inc ebx
    mov byte [eax + SHOW2DWALL], ch
loc_0db4:
    cmp bx, 0x400
    jl short loc_0da8
    movsx edx, word [MYCONNECTINDEX]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    mov edx, LINK_ADDRESS_12
    add eax, eax
    add edx, eax
    mov eax, 1
loc_0de0:
    call LINK_ADDRESS_17
    movsx edx, word [MYCONNECTINDEX]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    xor ebx, ebx
    mov word [nosplit eax*2 + LINK_ADDRESS_3], bx
    call LINK_ADDRESS_16
    add esp, 4
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    movsx edx, word [MYCONNECTINDEX]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    mov edx, LINK_ADDRESS_12
    add eax, eax
    add edx, eax
    mov eax, 0x63
    call LINK_ADDRESS_17
    movsx edx, word [MYCONNECTINDEX]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    xor edi, edi
    mov word [nosplit eax*2 + LINK_ADDRESS_3], di
    call LINK_ADDRESS_16
    add esp, 4
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    cmp dword [LINK_ADDRESS_96], 0
    sete al
    and eax, 0xff
    movsx edx, word [MYCONNECTINDEX]
    mov dword [LINK_ADDRESS_96], eax
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    xor bh, bh
    mov word [nosplit eax*2 + LINK_ADDRESS_3], bx
    call LINK_ADDRESS_16
    add esp, 4
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    movsx edx, word [MYCONNECTINDEX]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    mov edx, LINK_ADDRESS_12
    add eax, eax
    add edx, eax
    mov eax, 0x69
    call LINK_ADDRESS_17
    mov byte [LINK_ADDRESS_97], bl
    movsx edx, word [MYCONNECTINDEX]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    xor edx, edx
    mov word [nosplit eax*2 + LINK_ADDRESS_3], dx
    call LINK_ADDRESS_16
    add esp, 4
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    movsx edx, word [MYCONNECTINDEX]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    mov ecx, 0x18f
    add eax, eax
    mov esi, 0x4b0
    xor edi, edi
    mov word [eax + LINK_ADDRESS_18], cx
    mov edx, LINK_ADDRESS_12
    mov word [eax + LINK_ADDRESS_19], si
    add edx, eax
    mov word [eax + LINK_ADDRESS_3], di
    mov eax, 0x25
    call LINK_ADDRESS_17
    call LINK_ADDRESS_16
    add esp, 4
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    cmp byte [LINK_ADDRESS_98], 3
    jne short loc_0f7c
    mov byte [LINK_ADDRESS_98], bl
loc_0f7c:
    movsx edx, word [LINK_ADDRESS_99]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    xor ebx, ebx
    mov word [nosplit eax*2 + LINK_ADDRESS_3], bx
    inc byte [LINK_ADDRESS_98]
    call LINK_ADDRESS_16
    add esp, 4
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    movsx edx, word [MYCONNECTINDEX]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    mov bl, 1
    sub eax, edx
    mov byte [LINK_ADDRESS_100], bl
    or byte [nosplit eax*2 + LINK_ADDRESS_2], 8
    call LINK_ADDRESS_16
    add esp, 4
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
loc_0fe8:
    cmp byte [LINK_ADDRESS_101], 0
    je short loc_1012
    test dx, dx
    jl short loc_1012
    cmp word [NUMPLAYERS], 2
    jge short loc_1012
    cmp dword [LINK_ADDRESS_102], 0
    jne short loc_1012
    mov word [eax + LINK_ADDRESS_3], 0xffff
loc_1012:
    cmp byte [LINK_ADDRESS_30], 0
    je near loc_10c1
    movsx edx, word [MYCONNECTINDEX]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    add eax, eax
    movsx edx, word [eax + LINK_ADDRESS_3]
    cmp edx, -1
    jne short loc_10a0
    cmp dword [LINK_ADDRESS_59], 4
    jne short loc_1081
    mov edx, LINK_ADDRESS_12
    add edx, eax
    mov eax, 0x16
    call LINK_ADDRESS_17
    movsx edx, word [MYCONNECTINDEX]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    xor ecx, ecx
    mov word [nosplit eax*2 + LINK_ADDRESS_3], cx
    jmp short loc_1091
loc_1081:
    mov word [eax + LINK_ADDRESS_3], 1
    xor al, al
    mov byte [LINK_ADDRESS_7], al
loc_1091:
    call LINK_ADDRESS_16
    add esp, 4
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
loc_10a0:
    cmp word [eax + LINK_ADDRESS_3], 0
    je short loc_10c1
    xor edx, edx
    xor cl, cl
    mov word [eax + LINK_ADDRESS_3], dx
    mov byte [LINK_ADDRESS_101], cl
    mov byte [LINK_ADDRESS_30], cl
loc_10c1:
    add esp, 4
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    db 0x8d, 0x80, 0x00, 0x00, 0x00, 0x00    ; lea eax, [eax]
    db 0x8d, 0x92, 0x00, 0x00, 0x00, 0x00    ; lea edx, [edx]
    nop
