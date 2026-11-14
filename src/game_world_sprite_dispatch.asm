; Dispatch sprite behavior by picture number.
bits 32
org START_ADDRESS

    push ebx
    push ecx
    push edx
    push esi
    push edi
    push ebp
    sub esp, 0x30
    mov di, word [LINK_ADDRESS_1]
loc_0010:
    test di, di
    jl near loc_0f45
    movsx edx, di
    imul ecx, edx, 0x2c
    mov ax, word [ecx + LINK_ADDRESS_2]
    movsx ebx, ax
    mov dword [esp + 0x24], eax
    lea eax, [ebx*4]
    add eax, ebx
    mov ax, word [eax*8 + LINK_ADDRESS_3]
    mov dword [esp + 0x1c], eax
    mov ax, word [nosplit edx*2 + NEXTSPRITESTAT]
    mov bx, word [ecx + LINK_ADDRESS_5]
    mov dword [esp + 0x2c], eax
    cmp di, bx
    jne short loc_005e
    mov edi, eax
    jmp short loc_0010
loc_005e:
    lea eax, [edx*8]
    add eax, edx
    lea eax, [eax*8]
    sub eax, edx
    mov edx, dword [eax + LINK_ADDRESS_6]
    mov ebp, dword [eax + LINK_ADDRESS_7]
    test edx, edx
    jle short loc_0089
    lea ebx, [edx - 1]
    mov dword [eax + LINK_ADDRESS_6], ebx
loc_0089:
    movsx eax, word [esp + 0x24]
    mov ax, word [nosplit eax*2 + HEADSPRITESECT]
loc_0096:
    mov dword [esp + 0x20], eax
    mov ecx, dword [esp + 0x20]
    test cx, cx
    jl near loc_0f3c
    movsx edx, cx
    mov ax, word [nosplit edx*2 + NEXTSPRITESECT]
    imul edx, edx, 0x2c
    mov dword [esp + 0x28], eax
    mov ax, word [edx + LINK_ADDRESS_10]
    db 0x66, 0x3d, 0x04, 0x00    ; cmp ax, 4
    jb short loc_00f5
    db 0x66, 0x3d, 0x05, 0x00    ; cmp ax, 5
    jbe near loc_08be
    db 0x66, 0x3d, 0x0a, 0x00    ; cmp ax, 0xa
    jb near loc_0f33
    jbe short loc_0104
    db 0x66, 0x3d, 0x0c, 0x00    ; cmp ax, 0xc
    jb near loc_0f33
    db 0x66, 0x3d, 0x0d, 0x00    ; cmp ax, 0xd
    jbe near loc_08be
    jmp near loc_0f33
loc_00f5:
    db 0x66, 0x3d, 0x01, 0x00    ; cmp ax, 1
    je near loc_087d
    jmp near loc_0f33
loc_0104:
    movsx eax, word [edx + LINK_ADDRESS_5]
    cmp eax, -1
    je near loc_0f33
    mov si, word [edx + LINK_ADDRESS_11]
    movsx edx, si
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    add eax, eax
    mov byte [eax + LINK_ADDRESS_12], 1
    cmp word [eax + LINK_ADDRESS_13], 0
    jne near loc_030e
    cmp word [eax + LINK_ADDRESS_14], 0
    jne near loc_030e
    cmp byte [eax + LINK_ADDRESS_15], 0
    je near loc_033b
    cmp word [esp + 0x1c], 0
    jne near loc_033b
    test ebp, ebp
    je near loc_033b
    cmp byte [eax + LINK_ADDRESS_16], 0
    jne near loc_033b
    movsx eax, di
    imul edx, eax, 0x2c
    cmp byte [edx + LINK_ADDRESS_17], 0
    jne short loc_019a
    mov edx, 0x4ed
    call LINK_ADDRESS_18
loc_019a:
    mov dx, word [CONNECTHEAD]
    jmp short loc_01fd
loc_01a3:
    movsx eax, di
    imul eax, eax, 0x2c
    movsx eax, word [eax + LINK_ADDRESS_5]
    imul ecx, eax, 0x2c
    movsx ebx, dx
    mov eax, ebx
    shl eax, 7
    sub eax, ebx
    lea eax, [eax*4]
    sub eax, ebx
    add eax, eax
    mov bx, word [eax + LINK_ADDRESS_20]
    cmp bx, word [ecx + LINK_ADDRESS_2]
    jne short loc_01f2
    mov word [eax + LINK_ADDRESS_21], si
    movsx eax, word [eax + LINK_ADDRESS_22]
    imul eax, eax, 0x2c
    xor ebx, ebx
    mov word [eax + LINK_ADDRESS_23], bx
loc_01f2:
    movsx edx, dx
    mov dx, word [nosplit edx*2 + CONNECTPOINT2]
loc_01fd:
    test dx, dx
    jge short loc_01a3
    movsx eax, di
    mov dword [esp + 0x14], eax
    imul eax, eax, 0x2c
    movsx ebx, word [eax + LINK_ADDRESS_5]
    imul ecx, ebx, 0x2c
    movsx edx, si
    mov dword [esp], eax
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    add eax, eax
    mov dword [esp + 0x18], eax
    mov edx, dword [esp + 0x18]
    mov ax, word [ecx + LINK_ADDRESS_25]
    mov word [edx + LINK_ADDRESS_26], ax
    mov edx, dword [esp]
    mov ax, word [ecx + LINK_ADDRESS_5]
    cmp ax, word [edx + LINK_ADDRESS_5]
    je short loc_029d
    mov edx, dword [esp + 0x14]
    lea eax, [edx*8]
    add eax, edx
    lea eax, [eax*8]
    sub eax, edx
    mov ecx, 0xd
    mov dword [eax + LINK_ADDRESS_6], ecx
    lea eax, [ebx*8]
    add eax, ebx
    lea eax, [eax*8]
    sub eax, ebx
    mov dword [eax + LINK_ADDRESS_6], ecx
    mov eax, dword [esp + 0x18]
    mov word [eax + LINK_ADDRESS_13], 0xd
loc_029d:
    movsx ecx, di
    imul ecx, ecx, 0x2c
    movsx eax, word [ecx + LINK_ADDRESS_5]
    imul eax, eax, 0x2c
    movsx ebx, word [esp + 0x20]
    movsx edx, word [eax + LINK_ADDRESS_2]
    mov eax, ebx
    imul ebx, ebx, 0x2c
    call CHANGESPRITESECT
    movsx edx, si
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    lea edx, [eax + eax]
    mov ax, word [ebx + LINK_ADDRESS_2]
    mov word [edx + LINK_ADDRESS_20], ax
    cmp byte [ecx + LINK_ADDRESS_17], 0
    jne near loc_0f33
    mov edx, 0x4ed
    movsx eax, word [ecx + LINK_ADDRESS_5]
    call LINK_ADDRESS_18
    mov eax, dword [esp + 0x28]
    jmp near loc_0096
loc_030e:
    cmp word [esp + 0x1c], 1
    jne near loc_0f33
    movsx edx, si
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    cmp byte [nosplit eax*2 + LINK_ADDRESS_15], 1
    jne near loc_0f33
loc_033b:
    test ebp, ebp
    jne near loc_0514
    movsx eax, di
    imul ecx, eax, 0x2c
    movsx ebx, si
    mov eax, ebx
    shl eax, 7
    sub eax, ebx
    lea eax, [eax*4]
    sub eax, ebx
    lea edx, [eax + eax]
    mov eax, dword [ecx + LINK_ADDRESS_28]
    sub eax, dword [edx + LINK_ADDRESS_29]
    test eax, eax
    jns short loc_0371
    neg eax
loc_0371:
    cmp eax, 0x1800
    jge near loc_0514
    mov cl, byte [edx + LINK_ADDRESS_16]
    test cl, cl
    je short loc_03d3
    je short loc_039b
    lea eax, [ebx*4]
    add eax, ebx
    test byte [nosplit eax*2 + LINK_ADDRESS_30], 1
    jne short loc_03d3
loc_039b:
    movsx ebx, si
    mov eax, ebx
    shl eax, 7
    sub eax, ebx
    lea eax, [eax*4]
    sub eax, ebx
    cmp byte [nosplit eax*2 + LINK_ADDRESS_16], 0
    je near loc_0514
    lea eax, [ebx*4]
    add eax, ebx
    test byte [nosplit eax*2 + LINK_ADDRESS_30], 2
    je near loc_0514
loc_03d3:
    movsx ebx, si
    mov ecx, ebx
    shl ecx, 7
    sub ecx, ebx
    lea ecx, [ecx*4]
    sub ecx, ebx
    add ecx, ecx
    cmp byte [ecx + LINK_ADDRESS_16], 0
    je short loc_043e
    lea eax, [ebx*4]
    add eax, ebx
    test byte [nosplit eax*2 + LINK_ADDRESS_30], 1
    jne short loc_040d
    cmp byte [ecx + LINK_ADDRESS_16], 0xb
    jae short loc_043e
loc_040d:
    movsx eax, di
    imul eax, eax, 0x2c
    movsx eax, word [eax + LINK_ADDRESS_5]
    imul eax, eax, 0x2c
    movsx edx, si
    mov ebx, dword [eax + LINK_ADDRESS_28]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    sub ebx, 0x1800
    jmp short loc_046d
loc_043e:
    movsx eax, di
    imul eax, eax, 0x2c
    movsx eax, word [eax + LINK_ADDRESS_5]
    imul eax, eax, 0x2c
    movsx edx, si
    mov ebx, dword [eax + LINK_ADDRESS_28]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    add ebx, 0x1800
loc_046d:
    mov dword [nosplit eax*2 + LINK_ADDRESS_29], ebx
    movsx ecx, di
    imul ecx, ecx, 0x2c
    movsx edx, si
    mov ebx, edx
    shl ebx, 7
    sub ebx, edx
    lea ebx, [ebx*4]
    sub ebx, edx
    add ebx, ebx
    mov eax, dword [ebx + LINK_ADDRESS_29]
    movsx edx, word [ebx + LINK_ADDRESS_22]
    mov dword [ebx + LINK_ADDRESS_31], eax
    lea eax, [edx*8]
    add eax, edx
    lea eax, [eax*8]
    sub eax, edx
    mov edx, dword [ebx + LINK_ADDRESS_32]
    mov dword [eax + LINK_ADDRESS_33], edx
    mov edx, dword [ebx + LINK_ADDRESS_34]
    mov dword [eax + LINK_ADDRESS_35], edx
    mov edx, dword [ebx + LINK_ADDRESS_29]
    mov dword [eax + LINK_ADDRESS_36], edx
    movsx eax, word [ecx + LINK_ADDRESS_5]
    imul eax, eax, 0x2c
    movsx edx, word [eax + LINK_ADDRESS_2]
    movsx eax, word [esp + 0x20]
    call CHANGESPRITESECT
    movsx eax, word [ecx + LINK_ADDRESS_5]
    imul eax, eax, 0x2c
    mov ax, word [eax + LINK_ADDRESS_2]
    mov word [ebx + LINK_ADDRESS_20], ax
    mov eax, dword [esp + 0x28]
    jmp near loc_0096
loc_0514:
    xor edx, edx
    test ebp, ebp
    je near loc_0648
    cmp word [esp + 0x1c], 1
    jne near loc_0648
    movsx eax, si
    mov dword [esp + 0x10], eax
    mov ebx, eax
    shl eax, 7
    sub eax, ebx
    lea eax, [eax*4]
    sub eax, ebx
    lea ebx, [eax + eax]
    cmp byte [ebx + LINK_ADDRESS_15], 0
    je near loc_0648
    movsx eax, word [esp + 0x24]
    mov dword [esp + 8], eax
    mov ecx, dword [esp + 8]
    lea eax, [eax*4]
    add eax, ecx
    mov eax, dword [eax*8 + LINK_ADDRESS_37]
    mov ecx, dword [ebx + LINK_ADDRESS_29]
    sub eax, 0x1000
    cmp eax, ecx
    jge near loc_0648
    mov eax, dword [esp + 0x10]
    mov dword [esp + 8], eax
    mov ecx, dword [esp + 8]
    lea eax, [eax*4]
    add eax, ecx
    test byte [nosplit eax*2 + LINK_ADDRESS_30], 2
    jne short loc_05b0
    cmp dword [ebx + LINK_ADDRESS_38], 0x800
    jle near loc_0648
loc_05b0:
    mov cx, word [LINK_ADDRESS_39]
    mov edx, 1
    cmp si, cx
    jne short loc_05cb
    call LINK_ADDRESS_40
    call LINK_ADDRESS_41
loc_05cb:
    movsx eax, di
    imul eax, eax, 0x2c
    movsx eax, word [eax + LINK_ADDRESS_5]
    imul eax, eax, 0x2c
    movsx ebx, word [eax + LINK_ADDRESS_2]
    lea eax, [ebx*4]
    add eax, ebx
    movsx ebx, si
    mov ecx, dword [eax*8 + LINK_ADDRESS_42]
    mov eax, ebx
    shl eax, 7
    sub eax, ebx
    lea eax, [eax*4]
    sub eax, ebx
    lea ebx, [eax + eax]
    add ecx, 0x700
    mov dword [ebx + LINK_ADDRESS_29], ecx
    mov dword [ebx + LINK_ADDRESS_31], ecx
    call LINK_ADDRESS_43
    mov ecx, 0x1000
    and eax, 0x2000
    sub ecx, eax
    mov dword [ebx + LINK_ADDRESS_44], ecx
    call LINK_ADDRESS_43
    mov ecx, 0x1000
    and eax, 0x2000
    sub ecx, eax
    mov dword [ebx + LINK_ADDRESS_45], ecx
loc_0648:
    test ebp, ebp
    je near loc_0713
    cmp word [esp + 0x1c], 2
    jne near loc_0713
    movsx ebx, word [esp + 0x24]
    lea eax, [ebx*4]
    add eax, ebx
    movsx ebx, si
    mov ecx, dword [eax*8 + LINK_ADDRESS_42]
    mov eax, ebx
    shl eax, 7
    sub eax, ebx
    lea eax, [eax*4]
    sub eax, ebx
    add ecx, 0x600
    cmp ecx, dword [nosplit eax*2 + LINK_ADDRESS_29]
    jle near loc_0713
    mov bx, word [LINK_ADDRESS_39]
    mov edx, 1
    cmp si, bx
    jne short loc_06b2
    call LINK_ADDRESS_40
    call LINK_ADDRESS_41
loc_06b2:
    movsx eax, di
    imul eax, eax, 0x2c
    movsx eax, word [eax + LINK_ADDRESS_5]
    imul eax, eax, 0x2c
    movsx ebx, word [eax + LINK_ADDRESS_2]
    lea eax, [ebx*4]
    add eax, ebx
    movsx ebx, si
    mov ecx, dword [eax*8 + LINK_ADDRESS_37]
    mov eax, ebx
    shl eax, 7
    sub eax, ebx
    lea eax, [eax*4]
    sub eax, ebx
    sub ecx, 0x700
    mov dword [nosplit eax*2 + LINK_ADDRESS_29], ecx
    mov bl, 1
    mov dword [nosplit eax*2 + LINK_ADDRESS_31], ecx
    xor ecx, ecx
    mov byte [nosplit eax*2 + LINK_ADDRESS_46], bl
    mov word [nosplit eax*2 + LINK_ADDRESS_14], cx
loc_0713:
    cmp dx, 1
    jne near loc_0f33
    movsx eax, di
    imul eax, eax, 0x2c
    movsx edx, word [eax + LINK_ADDRESS_5]
    imul edx, edx, 0x2c
    mov bx, word [eax + LINK_ADDRESS_5]
    cmp bx, word [edx + LINK_ADDRESS_5]
    je short loc_075a
    movsx edx, si
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    mov word [nosplit eax*2 + LINK_ADDRESS_13], 0xfffe
loc_075a:
    movsx eax, di
    imul eax, eax, 0x2c
    movsx ebx, word [eax + LINK_ADDRESS_5]
    imul ebx, ebx, 0x2c
    movsx edx, si
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    add eax, eax
    mov dword [esp + 8], eax
    mov edx, dword [esp + 8]
    mov ax, word [ebx + LINK_ADDRESS_2]
    mov word [edx + LINK_ADDRESS_20], ax
    movsx edx, ax
    movsx eax, word [esp + 0x20]
    mov dword [esp + 0xc], eax
    call CHANGESPRITESECT
    mov eax, dword [esp + 8]
    mov ecx, dword [esp + 8]
    mov ebx, dword [esp + 8]
    mov eax, dword [eax + LINK_ADDRESS_32]
    mov ecx, dword [ecx + LINK_ADDRESS_29]
    mov dword [esp + 4], eax
    mov eax, dword [esp + 8]
    mov ebx, dword [ebx + LINK_ADDRESS_34]
    add ecx, 0x2600
    movsx eax, word [eax + LINK_ADDRESS_22]
    mov edx, dword [esp + 4]
    call LINK_ADDRESS_47
    mov eax, LINK_ADDRESS_48
    add eax, dword [esp + 8]
    call LINK_ADDRESS_49
    call LINK_ADDRESS_43
    and eax, 0xff
    cmp eax, 0x20
    jge short loc_080d
    mov edx, 0x564
    mov eax, dword [esp + 0xc]
    call LINK_ADDRESS_18
loc_080d:
    cmp word [esp + 0x1c], 1
    jne near loc_0f33
    xor ebx, ebx
    cmp bx, 9
    jl short loc_082a
    mov eax, dword [esp + 0x28]
    jmp near loc_0096
loc_082a:
    movsx edx, si
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    mov edx, 0x295
    movsx eax, word [nosplit eax*2 + LINK_ADDRESS_22]
    call LINK_ADDRESS_18
    movsx edx, ax
    imul edx, edx, 0x2c
    call LINK_ADDRESS_43
    and eax, 0x3fff
    mov ecx, dword [edx + LINK_ADDRESS_28]
    add ecx, eax
    inc ebx
    mov dword [edx + LINK_ADDRESS_28], ecx
    cmp bx, 9
    jl short loc_082a
    mov eax, dword [esp + 0x28]
    jmp near loc_0096
loc_087d:
    mov ax, word [edx + LINK_ADDRESS_50]
    cmp ax, 0x71c
    jb short loc_08a2
    jbe short loc_08a8
    cmp ax, 0x780
    jb short loc_08be
    jbe short loc_08a8
    cmp ax, 0x942
    jb short loc_08be
    cmp ax, 0x949
    jbe short loc_08a8
    jmp short loc_08be
loc_08a2:
    cmp ax, 0x60e
    jne short loc_08be
loc_08a8:
    movsx eax, word [esp + 0x20]
    imul eax, eax, 0x2c
    cmp word [eax + LINK_ADDRESS_23], 0
    jg near loc_0f33
loc_08be:
    movsx eax, word [esp + 0x20]
    imul esi, eax, 0x2c
    mov ax, word [esi + LINK_ADDRESS_51]
    cwde
    xor dl, dl
    test eax, eax
    jns short loc_08d6
    neg eax
loc_08d6:
    mov ebx, eax
    mov ecx, eax
    test eax, eax
    je short loc_090b
    cmp word [esp + 0x1c], 2
    jne short loc_090b
    movsx eax, word [esp + 0x24]
    mov dword [esp + 8], eax
    lea eax, [eax*4]
    add eax, dword [esp + 8]
    add ebx, dword [eax*8 + LINK_ADDRESS_42]
    cmp ebx, dword [esi + LINK_ADDRESS_28]
    jle short loc_090b
    mov dl, 1
loc_090b:
    test ecx, ecx
    je short loc_0940
    cmp word [esp + 0x1c], 1
    jne short loc_0940
    movsx ebx, word [esp + 0x24]
    lea eax, [ebx*4]
    add eax, ebx
    movsx ebx, word [esp + 0x20]
    imul ebx, ebx, 0x2c
    mov eax, dword [eax*8 + LINK_ADDRESS_37]
    sub eax, ecx
    cmp eax, dword [ebx + LINK_ADDRESS_28]
    jge short loc_0940
    mov dl, 1
loc_0940:
    cmp word [esp + 0x1c], 0
    jne near loc_09d5
    test ebp, ebp
    jne short loc_0977
    movsx eax, word [esp + 0x20]
    imul eax, eax, 0x2c
    movsx ebx, di
    imul ebx, ebx, 0x2c
    mov eax, dword [eax + LINK_ADDRESS_28]
    sub eax, dword [ebx + LINK_ADDRESS_28]
    test eax, eax
    jns short loc_0970
    neg eax
loc_0970:
    cmp eax, 0x1000
    jge short loc_09d5
loc_0977:
    movsx edx, di
    imul eax, edx, 0x2c
    movsx ebx, word [eax + LINK_ADDRESS_5]
    imul ebx, ebx, 0x2c
    mov si, word [eax + LINK_ADDRESS_5]
    cmp si, word [ebx + LINK_ADDRESS_5]
    je short loc_09d3
    test ebp, ebp
    je short loc_09d3
    lea ebx, [edx*8]
    add ebx, edx
    lea ebx, [ebx*8]
    sub ebx, edx
    cmp dword [ebx + LINK_ADDRESS_6], 0
    jle short loc_09d3
    movsx eax, word [esp + 0x20]
    imul eax, eax, 0x2c
    cmp word [eax + LINK_ADDRESS_10], 5
    je short loc_09d3
    inc dword [ebx + LINK_ADDRESS_6]
    jmp near loc_0f3c
loc_09d3:
    mov dl, 1
loc_09d5:
    test dl, dl
    je near loc_0f33
    movsx edx, word [esp + 0x20]
    imul edx, edx, 0x2c
    mov ax, word [edx + LINK_ADDRESS_50]
    cmp ax, 0x564
    jb short loc_0a46
    jbe near loc_0f33
    cmp ax, 0x8de
    jb short loc_0a32
    cmp ax, 0x8df
    jbe near loc_0f33
    cmp ax, 0x906
    jb near loc_0a8a
    cmp ax, 0x907
    jbe near loc_0f33
    cmp ax, 0xa06
    jb near loc_0a8a
    cmp ax, 0xa07
    jbe near loc_0f33
    jmp short loc_0a8a
loc_0a32:
    cmp ax, 0x58c
    jb short loc_0a8a
    jbe short loc_0a72
    cmp ax, 0x65e
    je near loc_0f33
    jmp short loc_0a8a
loc_0a46:
    cmp ax, 0x399
    jb short loc_0a6a
    jbe near loc_0f33
    cmp ax, 0x3b8
    jb short loc_0a8a
    jbe near loc_0f33
    cmp ax, 0x4ed
    je near loc_0f33
    jmp short loc_0a8a
loc_0a6a:
    cmp ax, 0x295
    je short loc_0abd
    jmp short loc_0a8a
loc_0a72:
    cmp word [esp + 0x1c], 2
    jne short loc_0a8a
    and byte [edx + LINK_ADDRESS_52], 0x7f
    mov eax, dword [esp + 0x28]
    jmp near loc_0096
loc_0a8a:
    movsx eax, word [esp + 0x20]
    imul eax, eax, 0x2c
    cmp word [eax + LINK_ADDRESS_10], 5
    jne short loc_0abd
    mov eax, dword [esp + 0x1c]
    db 0x66, 0x3d, 0x01, 0x00    ; cmp ax, 1
    je short loc_0ab3
    db 0x66, 0x3d, 0x02, 0x00    ; cmp ax, 2
    je short loc_0ab3
    mov eax, 1
    jmp short loc_0ab5
loc_0ab3:
    xor eax, eax
loc_0ab5:
    test eax, eax
    jne near loc_0f33
loc_0abd:
    cmp word [esp + 0x1c], 0
    jle short loc_0b1b
    movsx ebx, word [esp + 0x20]
    mov edx, 0x564
    mov eax, ebx
    mov esi, dword [esp + 0x1c]
    call LINK_ADDRESS_18
    cmp si, 1
    jne short loc_0b1b
    imul edx, ebx, 0x2c
    cmp word [edx + LINK_ADDRESS_10], 4
    jne short loc_0b1b
    movsx ebx, word [edx + LINK_ADDRESS_53]
    sar ebx, 1
    cwde
    mov esi, ebx
    imul ebx, eax, 0x2c
    mov word [ebx + LINK_ADDRESS_53], si
    mov dx, word [edx + LINK_ADDRESS_25]
    mov word [ebx + LINK_ADDRESS_25], dx
    mov edx, 0x10001
    call LINK_ADDRESS_54
loc_0b1b:
    mov esi, dword [esp + 0x1c]
    cmp si, 1
    jb short loc_0b3e
    jbe near loc_0dd8
    cmp si, 2
    je near loc_0e60
    mov eax, dword [esp + 0x28]
    jmp near loc_0096
loc_0b3e:
    test si, si
    jne near loc_0f33
    test ebp, ebp
    je near loc_0d1c
    movsx eax, word [esp + 0x20]
    imul eax, eax, 0x2c
    cmp word [eax + LINK_ADDRESS_10], 4
    je short loc_0b9b
    movsx eax, word [esp + 0x24]
    call LINK_ADDRESS_55
    cwde
    cmp eax, -1
    jne near loc_0f33
    movsx eax, di
    imul eax, eax, 0x2c
    movsx eax, word [eax + LINK_ADDRESS_5]
    imul eax, eax, 0x2c
    movsx eax, word [eax + LINK_ADDRESS_2]
    call LINK_ADDRESS_55
    cwde
    cmp eax, -1
    jne near loc_0f33
loc_0b9b:
    movsx esi, di
    imul ebx, esi, 0x2c
    movsx eax, word [esp + 0x20]
    mov dword [esp + 4], eax
    imul eax, eax, 0x2c
    movsx edx, word [ebx + LINK_ADDRESS_5]
    imul edx, edx, 0x2c
    mov ecx, dword [ebx + SPRITE]
    mov edx, dword [edx + SPRITE]
    sub edx, ecx
    add dword [eax + SPRITE], edx
    movsx edx, word [ebx + LINK_ADDRESS_5]
    imul edx, edx, 0x2c
    mov ecx, dword [ebx + LINK_ADDRESS_57]
    mov edx, dword [edx + LINK_ADDRESS_57]
    sub edx, ecx
    add dword [eax + LINK_ADDRESS_57], edx
    movsx edx, word [ebx + LINK_ADDRESS_5]
    imul edx, edx, 0x2c
    movsx edx, word [edx + LINK_ADDRESS_2]
    mov dword [esp + 8], edx
    mov ecx, dword [esp + 8]
    lea edx, [edx*4]
    add ecx, edx
    lea ecx, [ecx*8]
    mov edx, dword [ebx + LINK_ADDRESS_28]
    sub edx, dword [ecx + LINK_ADDRESS_37]
    sub dword [eax + LINK_ADDRESS_28], edx
    movsx edx, word [ebx + LINK_ADDRESS_5]
    imul edx, edx, 0x2c
    mov dx, word [edx + LINK_ADDRESS_25]
    mov ecx, dword [esp + 4]
    mov word [eax + LINK_ADDRESS_25], dx
    lea edx, [ecx*8]
    add edx, ecx
    lea edx, [edx*8]
    sub edx, ecx
    mov ecx, dword [eax + SPRITE]
    mov dword [edx + LINK_ADDRESS_33], ecx
    mov ecx, dword [eax + LINK_ADDRESS_57]
    mov eax, dword [eax + LINK_ADDRESS_28]
    mov dword [edx + LINK_ADDRESS_35], ecx
    mov cl, byte [ebx + LINK_ADDRESS_17]
    mov dword [edx + LINK_ADDRESS_36], eax
    test cl, cl
    jne short loc_0c9d
    mov edx, 0x4ed
    mov eax, esi
    call LINK_ADDRESS_18
    mov edx, 0x4ed
    movsx eax, word [ebx + LINK_ADDRESS_5]
    call LINK_ADDRESS_18
loc_0c9d:
    movsx edx, di
    imul eax, edx, 0x2c
    movsx ebx, word [eax + LINK_ADDRESS_5]
    imul ecx, ebx, 0x2c
    mov si, word [eax + LINK_ADDRESS_5]
    cmp si, word [ecx + LINK_ADDRESS_5]
    je short loc_0cf2
    lea eax, [edx*8]
    add eax, edx
    lea eax, [eax*8]
    sub eax, edx
    mov esi, 0xd
    mov dword [eax + LINK_ADDRESS_6], esi
    lea eax, [ebx*8]
    add eax, ebx
    lea eax, [eax*8]
    sub eax, ebx
    mov dword [eax + LINK_ADDRESS_6], esi
loc_0cf2:
    movsx eax, di
    imul eax, eax, 0x2c
    movsx eax, word [eax + LINK_ADDRESS_5]
    imul eax, eax, 0x2c
    movsx edx, word [eax + LINK_ADDRESS_2]
    movsx eax, word [esp + 0x20]
    call CHANGESPRITESECT
    mov eax, dword [esp + 0x28]
    jmp near loc_0096
loc_0d1c:
    movsx ebx, di
    imul ebx, ebx, 0x2c
    movsx ecx, word [esp + 0x20]
    imul edx, ecx, 0x2c
    movsx eax, word [ebx + LINK_ADDRESS_5]
    imul eax, eax, 0x2c
    mov esi, dword [ebx + SPRITE]
    mov eax, dword [eax + SPRITE]
    sub eax, esi
    add dword [edx + SPRITE], eax
    movsx eax, word [ebx + LINK_ADDRESS_5]
    imul eax, eax, 0x2c
    mov esi, dword [ebx + LINK_ADDRESS_57]
    mov eax, dword [eax + LINK_ADDRESS_57]
    sub eax, esi
    add dword [edx + LINK_ADDRESS_57], eax
    movsx eax, word [ebx + LINK_ADDRESS_5]
    imul eax, eax, 0x2c
    mov eax, dword [eax + LINK_ADDRESS_28]
    add eax, 0x1000
    mov dword [edx + LINK_ADDRESS_28], eax
    lea eax, [ecx*8]
    add eax, ecx
    lea eax, [eax*8]
    sub eax, ecx
    mov esi, dword [edx + SPRITE]
    mov dword [eax + LINK_ADDRESS_33], esi
    mov esi, dword [edx + LINK_ADDRESS_57]
    mov edx, dword [edx + LINK_ADDRESS_28]
    mov dword [eax + LINK_ADDRESS_35], esi
    mov dword [eax + LINK_ADDRESS_36], edx
    movsx eax, word [ebx + LINK_ADDRESS_5]
    imul eax, eax, 0x2c
    movsx edx, word [eax + LINK_ADDRESS_2]
    mov eax, ecx
    call CHANGESPRITESECT
    mov eax, dword [esp + 0x28]
    jmp near loc_0096
loc_0dd8:
    movsx ebx, di
    imul ebx, ebx, 0x2c
    movsx eax, word [esp + 0x20]
    mov dword [esp + 4], eax
    imul edx, eax, 0x2c
    movsx eax, word [ebx + LINK_ADDRESS_5]
    imul eax, eax, 0x2c
    mov esi, dword [ebx + SPRITE]
    mov eax, dword [eax + SPRITE]
    sub eax, esi
    add dword [edx + SPRITE], eax
    movsx eax, word [ebx + LINK_ADDRESS_5]
    imul eax, eax, 0x2c
    mov esi, dword [ebx + LINK_ADDRESS_57]
    mov eax, dword [eax + LINK_ADDRESS_57]
    sub eax, esi
    add dword [edx + LINK_ADDRESS_57], eax
    movsx eax, word [ebx + LINK_ADDRESS_5]
    imul eax, eax, 0x2c
    movsx eax, word [eax + LINK_ADDRESS_2]
    mov dword [esp + 8], eax
    mov esi, dword [esp + 8]
    lea eax, [eax*4]
    add eax, esi
    mov esi, dword [eax*8 + LINK_ADDRESS_42]
    add ecx, esi
    mov dword [edx + LINK_ADDRESS_28], ecx
    mov ecx, dword [esp + 4]
    jmp near loc_0ee3
loc_0e60:
    movsx ebx, di
    imul ebx, ebx, 0x2c
    movsx eax, word [esp + 0x20]
    mov dword [esp + 4], eax
    imul edx, eax, 0x2c
    movsx eax, word [ebx + LINK_ADDRESS_5]
    imul eax, eax, 0x2c
    mov esi, dword [ebx + SPRITE]
    mov eax, dword [eax + SPRITE]
    sub eax, esi
    add dword [edx + SPRITE], eax
    movsx eax, word [ebx + LINK_ADDRESS_5]
    imul eax, eax, 0x2c
    mov esi, dword [ebx + LINK_ADDRESS_57]
    mov eax, dword [eax + LINK_ADDRESS_57]
    sub eax, esi
    add dword [edx + LINK_ADDRESS_57], eax
    movsx eax, word [ebx + LINK_ADDRESS_5]
    imul eax, eax, 0x2c
    movsx eax, word [eax + LINK_ADDRESS_2]
    mov dword [esp + 8], eax
    mov esi, dword [esp + 8]
    lea eax, [eax*4]
    add eax, esi
    mov eax, dword [eax*8 + LINK_ADDRESS_37]
    sub eax, ecx
    mov ecx, dword [esp + 4]
    mov dword [edx + LINK_ADDRESS_28], eax
loc_0ee3:
    lea eax, [ecx*8]
    add eax, ecx
    lea eax, [eax*8]
    sub eax, ecx
    mov ecx, dword [edx + SPRITE]
    mov dword [eax + LINK_ADDRESS_33], ecx
    mov ecx, dword [edx + LINK_ADDRESS_57]
    mov edx, dword [edx + LINK_ADDRESS_28]
    mov dword [eax + LINK_ADDRESS_35], ecx
    mov dword [eax + LINK_ADDRESS_36], edx
    movsx eax, word [ebx + LINK_ADDRESS_5]
    imul eax, eax, 0x2c
    movsx edx, word [eax + LINK_ADDRESS_2]
    mov eax, dword [esp + 4]
    call CHANGESPRITESECT
loc_0f33:
    mov eax, dword [esp + 0x28]
    jmp near loc_0096
loc_0f3c:
    mov edi, dword [esp + 0x2c]
    jmp near loc_0010
loc_0f45:
    add esp, 0x30
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    nop
