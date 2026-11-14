; Dispatch player interactions by target type.
bits 32
org START_ADDRESS

%if GAME_UPDATE
loc_0000:
    push ebx
    push ecx
    push esi
    push edi
    push ebp
    sub esp, 0x20
    cwde
    imul eax, eax, 0x2c
    mov esi, 0x2522b4
    add esi, eax
    mov eax, 0x800
    movsx ebx, dx
    mov edx, eax
    sar edx, 0x1f
    idiv ebx
    mov ebp, 0xc0000000
    mov dx, word [esi + 0xe]
    mov dword [esp + 0x18], eax
    cmp dx, 0x214
    je short loc_0051
    mov eax, dword [0x6c504]
    mov eax, dword [eax]
    and eax, 0x3f
    cmp eax, 2
    jle short loc_0051
    mov ax, word [esi + 0x1c]
    add ah, 4
    jmp near loc_0103
loc_0051:
    mov di, word [esi + 0x1c]
    jmp near loc_00e7
loc_005a:
    push 0x1000040
    lea edx, [esp + 4]
    push edx
    lea edx, [esp + 0xc]
    push edx
    lea edx, [esp + 0x14]
    push edx
    lea edx, [esp + 0x20]
    push edx
    lea edx, [esp + 0x28]
    push edx
    lea edx, [esp + 0x24]
    add eax, 0x200
    push edx
    mov edx, edi
    movsx ecx, word [esi + 0x18]
    and dh, 7
    and eax, 0x7ff
    movsx edx, dx
    push 0
    db 0x0f, 0xbf, 0x14, 0x55, 0xb4, 0x96, 0x24, 0x00    ; movsx edx, word [edx*2 + 0x2496b4]
    mov ebx, dword [esi + 8]
    push edx
    db 0x0f, 0xbf, 0x04, 0x45, 0xb4, 0x96, 0x24, 0x00    ; movsx eax, word [eax*2 + 0x2496b4]
    sub ebx, 0x800
    push eax
    mov edx, dword [esi + 4]
    mov eax, dword [esi]
    call 0x68581
    mov eax, dword [esp + 8]
    sub eax, dword [esi]
    test eax, eax
    jns short loc_00c6
    neg eax
loc_00c6:
    mov ecx, eax
    mov ebx, dword [esi + 4]
    mov eax, dword [esp + 4]
    sub eax, ebx
    test eax, eax
    jns short loc_00d7
    neg eax
loc_00d7:
    add eax, ecx
    cmp eax, ebp
    jle short loc_00e3
    mov ebp, eax
    mov dword [esp + 0x1c], edi
loc_00e3:
    add edi, dword [esp + 0x18]
loc_00e7:
    movsx edx, word [esi + 0x1c]
    movsx eax, di
    add edx, 0x800
    cmp eax, edx
    jl near loc_005a
    mov eax, dword [esp + 0x1c]
    and ah, 7
loc_0103:
    add esp, 0x20
    pop ebp
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
    db 0x8d, 0x44, 0x20, 0x00    ; lea eax, [eax]
    push esi
    push edi
    push ebp
    sub esp, 0x24
    mov esi, edx
    mov ebp, ebx
    mov dword [esp + 0xc], ecx
    cwde
    imul eax, eax, 0x2c
    mov edi, 0x2522b4
    add edi, eax
    mov eax, dword [0x6c504]
    test byte [eax], 0x3f
    jne near loc_02a5
    cmp dword [0x1261df], 2
    jge short loc_0153
    cmp dword [0x1261e3], 3
    jge short loc_0153
    mov dword [esp + 0x14], 0x400
    jmp short loc_016e
loc_0153:
    call 0x6dc5f
    and eax, 1
    lea ebx, [eax + 1]
    mov eax, 0x800
    mov edx, eax
    sar edx, 0x1f
    idiv ebx
    mov dword [esp + 0x14], eax
loc_016e:
    mov ax, word [esi + 0x1c]
    mov dword [esp + 0x18], eax
    jmp near loc_028f
loc_017b:
    push 0x1000040
    lea eax, [esp + 4]
    push eax
    lea eax, [esp + 0xc]
    push eax
    lea eax, [esp + 0x14]
    push eax
    lea eax, [esp + 0x2c]
    push eax
    lea eax, [esp + 0x24]
    push eax
    lea eax, [esp + 0x38]
    push eax
    mov ebx, 0x4000
    call 0x6dc5f
    and eax, 0x7fff
    sub ebx, eax
    mov eax, dword [esp + 0x34]
    and ah, 7
    cwde
    push ebx
    db 0x0f, 0xbf, 0x04, 0x45, 0xb4, 0x96, 0x24, 0x00    ; movsx eax, word [eax*2 + 0x2496b4]
    push eax
    lea eax, [edx + 0x200]
    and eax, 0x7ff
    movsx ecx, word [esi + 0x18]
    mov ebx, dword [esi + 8]
    db 0x0f, 0xbf, 0x04, 0x45, 0xb4, 0x96, 0x24, 0x00    ; movsx eax, word [eax*2 + 0x2496b4]
    sub ebx, 0x1000
    push eax
    mov edx, dword [esi + 4]
    mov eax, dword [esi]
    call 0x68581
    mov eax, dword [esp + 8]
    sub eax, dword [esi]
    test eax, eax
    jns short loc_01f8
    neg eax
loc_01f8:
    mov edx, eax
    mov ebx, dword [esi + 4]
    mov eax, dword [esp + 4]
    sub eax, ebx
    test eax, eax
    jns short loc_0209
    neg eax
loc_0209:
    mov ecx, dword [edi]
    lea ebx, [edx + eax]
    mov eax, dword [esp + 8]
    sub eax, ecx
    test eax, eax
    jns short loc_021a
    neg eax
loc_021a:
    mov edx, eax
    mov ecx, dword [edi + 4]
    mov eax, dword [esp + 4]
    sub eax, ecx
    test eax, eax
    jns short loc_022b
    neg eax
loc_022b:
    add eax, edx
    cmp ebx, eax
    jge short loc_0277
    movsx eax, word [edi + 0x18]
    push eax
    mov eax, dword [edi + 8]
    sub eax, 0x1000
    push eax
    mov eax, dword [edi + 4]
    movsx ecx, word [esp + 0x28]
    push eax
    mov edx, dword [edi]
    mov ebx, dword [esp + 0xc]
    push edx
    mov eax, dword [esp + 0x18]
    mov edx, dword [esp + 0x14]
    call 0x6830d
    test eax, eax
    je short loc_0277
    mov eax, dword [esp + 8]
    mov dword [ebp], eax
    mov edx, dword [esp + 0xc]
    mov eax, dword [esp + 4]
    mov dword [edx], eax
    mov eax, dword [esp + 0x20]
    jmp short loc_02aa
loc_0277:
    call 0x6dc5f
    mov edx, dword [esp + 0x14]
    and ah, 1
    mov ebx, dword [esp + 0x18]
    sub edx, eax
    add ebx, edx
    mov dword [esp + 0x18], ebx
loc_028f:
    movsx eax, word [esi + 0x1c]
    movsx edx, word [esp + 0x18]
    add eax, 0x800
    cmp edx, eax
    jl near loc_017b
loc_02a5:
    mov eax, 0xffffffff
loc_02aa:
    add esp, 0x24
    pop ebp
    pop edi
    pop esi
    ret
    db 0x8d, 0x80, 0x00, 0x00, 0x00, 0x00    ; lea eax, [eax]
    db 0x8d, 0x92, 0x00, 0x00, 0x00, 0x00    ; lea edx, [edx]
    db 0x8d, 0x40, 0x00    ; lea eax, [eax]
loc_02c0:
    push ebx
    push ecx
    push edx
    push esi
    push edi
    push ebp
    sub esp, 4
    mov ecx, eax
    mov eax, dword [0x6c504]
    mov ebx, dword [0x6c508]
    mov ebp, 5
    mov esi, dword [eax + 4]
    movsx edi, word [ebx + 0x20]
    mov eax, dword [eax]
    mov edx, dword [esi]
    and eax, 0x1f
    sub edx, edi
    mov dword [esp], eax
    mov eax, edx
    sar edx, 0x1f
    idiv ebp
    add eax, edi
    mov word [ebx + 0x20], ax
    mov ebx, dword [0x6c508]
    cmp word [ebx + 0x24], 0x288
    jge short loc_0322
    mov edx, dword [esi + 4]
    shl edx, 4
    movsx esi, word [ebx + 0x24]
    sub edx, esi
    mov eax, edx
    sar edx, 0x1f
    idiv ebp
    add eax, esi
    mov word [ebx + 0x24], ax
loc_0322:
    cmp dword [esp], 1
    jge short loc_0394
    mov ebx, 2
    test ch, 4
    je short loc_0376
    mov edx, 2
    movsx eax, word [0x6c6ec]
    call loc_0000
    mov edx, dword [0x6c508]
    mov word [edx + 0x1c], ax
    movsx edx, word [0x6c6ee]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    mov edx, dword [0x6c508]
    db 0x66, 0x8b, 0x04, 0x45, 0x60, 0x1a, 0x0f, 0x00    ; mov ax, word [eax*2 + 0xf1a60]
    mov word [edx + 0x1e], ax
loc_0376:
    test cl, 0x80
    je short loc_0394
    movsx eax, word [0x6c6ec]
    movsx edx, bx
    call loc_0000
    mov edx, dword [0x6c508]
    mov word [edx + 0x1c], ax
loc_0394:
    add esp, 4
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    db 0x8b, 0xc0    ; mov eax, eax
    push ebx
    push ecx
    push edx
    push esi
    push edi
    push ebp
    mov eax, dword [0x6c504]
    mov edx, dword [eax]
    mov edi, dword [0x6c508]
    inc edx
    mov di, word [edi + 0x28]
    mov dword [eax], edx
    mov eax, dword [0x6c508]
    call 0x16e70
    test eax, eax
    je near loc_0456
    movsx edx, word [0x6c6ee]
    mov esi, edx
    shl esi, 7
    sub esi, edx
    lea esi, [esi*4]
    sub esi, edx
    add esi, esi
    mov eax, dword [esi + 0xf196c]
    mov edx, eax
    mov ebx, 0x300
    sar edx, 0x1f
    idiv ebx
    mov ecx, dword [esi + 0xf1934]
    add ecx, eax
    mov eax, dword [esi + 0xf1970]
    mov edx, eax
    sar edx, 0x1f
    idiv ebx
    mov edx, dword [esi + 0xf1938]
    add edx, eax
    mov eax, dword [0x6c508]
    mov ebx, dword [eax + 4]
    mov esi, dword [eax]
    mov eax, ecx
    sub edx, ebx
    sub eax, esi
    call 0x62b58
    movsx edx, ax
    mov eax, dword [0x6c508]
    movsx eax, word [eax + 0x1c]
    call 0x34a20
    cwde
    sar eax, 2
    mov ebx, eax
    cwde
    cmp eax, -8
    jle short loc_044d
    test bx, bx
    jge short loc_044d
    xor ebx, ebx
loc_044d:
    mov eax, dword [0x6c508]
    add word [eax + 0x1c], bx
loc_0456:
    mov eax, dword [0x6c508]
    call 0x16ec0
    test eax, eax
    je near loc_04ec
    movsx esi, word [0x6c6ec]
    lea esi, [esi*4]
    mov ebp, dword [esi + 0x1acd8]
    test ebp, ebp
    je short loc_04ec
    movsx edx, word [ebp + 0x20]
    mov ebx, 0x300
    mov eax, edx
    sar edx, 0x1f
    idiv ebx
    mov ecx, 0x300
    mov ebx, dword [ebp]
    movsx edx, word [ebp + 0x22]
    add ebx, eax
    mov eax, edx
    sar edx, 0x1f
    idiv ecx
    mov edx, dword [ebp + 4]
    add edx, eax
    mov eax, dword [0x6c508]
    mov ecx, dword [eax + 4]
    mov esi, dword [eax]
    mov eax, ebx
    sub edx, ecx
    sub eax, esi
    call 0x62b58
    mov ecx, eax
    movsx edx, ax
    mov eax, dword [0x6c508]
    movsx eax, word [eax + 0x1c]
    call 0x34a20
    movsx ebx, ax
    sar ebx, 2
    movsx eax, bx
    cmp eax, -8
    jle short loc_04e3
    test bx, bx
loc_04e3:
    mov eax, dword [0x6c508]
    mov word [eax + 0x1c], cx
loc_04ec:
    mov eax, dword [0x6c504]
    cmp dword [eax + 4], 0
    je short loc_0500
    test di, di
    jne near loc_05a3
loc_0500:
    mov eax, dword [0x6c508]
    call 0x16e70
    test eax, eax
    jne short loc_051c
    mov eax, dword [0x6c508]
    call 0x16ec0
    test eax, eax
    je short loc_0528
loc_051c:
    mov eax, dword [0x6c508]
    cmp word [eax + 0x2a], 0
    jle short loc_0560
loc_0528:
    movsx edx, word [0x6c6ec]
    lea eax, [edx*8]
    add eax, edx
    lea eax, [eax*8]
    sub eax, edx
    mov edx, dword [0x6c508]
    mov ebx, dword [eax + 0x8b0db]
    cmp ebx, dword [edx]
    jne short loc_0560
    mov eax, dword [eax + 0x8b0df]
    cmp eax, dword [edx + 4]
    je near loc_0b87
loc_0560:
    movsx esi, word [0x6c6ec]
    lea eax, [esi*8]
    add eax, esi
    lea eax, [eax*8]
    mov edx, dword [0x6c508]
    sub eax, esi
    mov ebx, dword [edx]
    mov dword [eax + 0x8b0db], ebx
    mov ebx, dword [edx + 4]
    mov dword [eax + 0x8b0df], ebx
    mov eax, esi
    mov ecx, dword [edx + 8]
    mov edx, dword [edx]
    call 0x67ce6
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
loc_05a3:
    mov eax, dword [0x6c508]
    cmp word [eax + 0xe], 0x214
    je short loc_05b8
    movsx eax, di
    call loc_02c0
loc_05b8:
    mov eax, dword [0x6c508]
    movsx edx, word [eax + 0x20]
    cmp edx, -6
    jle short loc_05d3
    cmp word [eax + 0x20], 6
    jge short loc_05d3
    mov word [eax + 0x20], 0
loc_05d3:
    mov eax, dword [0x6c508]
    mov si, word [eax + 0x20]
    xor edi, edi
    test si, si
    jne short loc_05ee
    cmp word [eax + 0x24], 0
    je near loc_0b18
loc_05ee:
    test di, di
    je near loc_0821
    mov eax, dword [0x6c508]
    mov bx, word [eax + 0xe]
    cmp bx, 0x938
    je near loc_0821
    cmp bx, 0x758
    je short loc_061d
    cmp bx, 0x780
    jne near loc_079d
loc_061d:
    mov eax, dword [0x6c508]
    cmp word [eax + 0x2a], 0
    jle near loc_079d
    cmp word [eax + 0xe], 0x780
    jne near loc_06ed
    mov ebx, dword [eax + 4]
    mov edx, dword [eax]
    movsx eax, word [eax + 0x18]
    call 0x7485f
    movsx ebx, word [0x6c6ec]
    mov edx, eax
    lea eax, [ebx*8]
    add eax, ebx
    lea eax, [eax*8]
    sub eax, ebx
    mov dword [eax + 0x8b0cb], edx
    mov eax, dword [0x6c508]
    sub edx, 0x800
    mov ebx, dword [eax + 8]
    cmp edx, ebx
    jge short loc_068a
    jge short loc_067f
    mov dword [eax + 8], edx
loc_067f:
    mov eax, dword [0x6c508]
    mov word [eax + 0x24], 0
loc_068a:
    mov eax, dword [0x6c508]
    mov ebx, dword [eax + 4]
    mov edx, dword [eax]
    movsx eax, word [eax + 0x18]
    call 0x74781
    movsx esi, word [0x6c6ec]
    mov edx, eax
    lea eax, [esi*8]
    add eax, esi
    lea eax, [eax*8]
    sub eax, esi
    mov dword [eax + 0x8b0cf], edx
    mov eax, dword [0x6c508]
    mov ebx, dword [eax + 8]
    sub ebx, edx
    cmp ebx, 0x5000
    jge near loc_0865
    add edx, 0x5000
    mov dword [eax + 8], edx
    mov eax, dword [0x6c508]
    mov word [eax + 0x24], 0
    jmp near loc_0865
loc_06ed:
    cmp word [eax + 0x24], 0
    jle short loc_073f
    mov ebx, dword [eax + 4]
    mov edx, dword [eax]
    movsx eax, word [eax + 0x18]
    call 0x7485f
    movsx edx, word [0x6c6ec]
    mov ebx, eax
    lea eax, [edx*8]
    add eax, edx
    lea eax, [eax*8]
    sub eax, edx
    mov dword [eax + 0x8b0cb], ebx
    mov eax, dword [0x6c508]
    sub ebx, 0x1e00
    cmp ebx, dword [eax + 8]
    jge near loc_0865
    mov dword [eax + 8], ebx
    jmp near loc_0865
loc_073f:
    mov ebx, dword [eax + 4]
    mov edx, dword [eax]
    movsx eax, word [eax + 0x18]
    call 0x74781
    movsx esi, word [0x6c6ec]
    mov edx, eax
    lea eax, [esi*8]
    add eax, esi
    lea eax, [eax*8]
    sub eax, esi
    mov dword [eax + 0x8b0cf], edx
    mov eax, dword [0x6c508]
    mov ebx, dword [eax + 8]
    sub ebx, edx
    cmp ebx, 0x3200
    jge near loc_0865
    add edx, 0x3200
    mov dword [eax + 8], edx
    mov eax, dword [0x6c508]
    mov word [eax + 0x24], 0
    jmp near loc_0865
loc_079d:
    mov edx, dword [0x6c508]
    cmp word [edx + 0xe], 0x974
    je near loc_0865
    cmp word [edx + 0x24], 0
    jle short loc_07dd
    movsx esi, word [0x6c6ec]
    lea eax, [esi*8]
    add eax, esi
    lea eax, [eax*8]
    sub eax, esi
    mov ebx, dword [eax + 0x8b0cb]
    cmp ebx, dword [edx + 8]
    jge short loc_07dd
    mov dword [edx + 8], ebx
loc_07dd:
    mov eax, dword [0x6c508]
    cmp word [eax + 0x24], 0
    jge near loc_0865
    mov ebx, dword [eax + 4]
    mov edx, dword [eax]
    movsx eax, word [eax + 0x18]
    call 0x74781
    mov edx, dword [0x6c508]
    mov ebx, dword [edx + 8]
    sub ebx, eax
    cmp ebx, 0x4200
    jge short loc_0865
    add eax, 0x4200
    mov dword [edx + 8], eax
    mov eax, dword [0x6c508]
    sar word [eax + 0x24], 1
    jmp short loc_0865
loc_0821:
    mov ebx, dword [0x6c508]
    cmp word [ebx + 0xe], 0x214
    jne short loc_0865
    movsx edx, word [0x6c6ec]
    lea eax, [edx*8]
    add eax, edx
    lea eax, [eax*8]
    sub eax, edx
    mov edx, eax
    mov eax, dword [ebx + 8]
    mov ecx, dword [edx + 0x8b0cf]
    sub eax, ecx
    cmp eax, 0x2000
    jge short loc_0865
    lea eax, [ecx + 0x2000]
    mov dword [ebx + 8], eax
loc_0865:
    mov edx, dword [0x6c508]
    movsx esi, word [edx + 0x20]
    mov bx, word [edx + 0x1c]
    test di, di
    je near loc_0aa6
    cmp word [edx + 0xe], 0x938
    je near loc_0aa6
    mov ebp, dword [0x6c50c]
    cmp ebp, 0x3c0
    jge near loc_09b6
    cmp byte [edx + 0x14], 0x10
    jbe near loc_09b6
    movsx ebx, word [0x6c6ee]
    mov ecx, ebx
    shl ecx, 7
    sub ecx, ebx
    lea ecx, [ecx*4]
    sub ecx, ebx
    mov esi, 0x400
    add ecx, ecx
    sub esi, ebp
    mov ebp, dword [edx + 4]
    mov ebx, dword [ecx + 0xf1938]
    mov eax, dword [ecx + 0xf1934]
    sub ebx, ebp
    mov ecx, dword [edx]
    mov edx, ebx
    sub eax, ecx
    neg esi
    call 0x62b58
    mov ebp, dword [0x6c50c]
    mov ebx, eax
    cmp ebp, 0x200
    jge short loc_091e
    movsx edx, word [0x6c6ee]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    xor edx, edx
    db 0x89, 0x14, 0x45, 0x6c, 0x19, 0x0f, 0x00    ; mov dword [eax*2 + 0xf196c], edx
    db 0x89, 0x14, 0x45, 0x70, 0x19, 0x0f, 0x00    ; mov dword [eax*2 + 0xf1970], edx
    jmp near loc_0aa6
loc_091e:
    movsx edx, word [0x6c6ee]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    mov ebp, dword [0x8db8]
    lea eax, [eax*4]
    sub ebp, 0x2000
    sub eax, edx
    mov ecx, 0x10
    mov edx, ebp
    db 0x8b, 0x04, 0x45, 0x6c, 0x19, 0x0f, 0x00    ; mov eax, dword [eax*2 + 0xf196c]
    imul edx
    shrd eax, edx, cl
    movsx edx, word [0x6c6ee]
    mov ecx, eax
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    mov edx, dword [0x8db8]
    db 0x89, 0x0c, 0x45, 0x6c, 0x19, 0x0f, 0x00    ; mov dword [eax*2 + 0xf196c], ecx
    mov ecx, 0x10
    sub edx, 0x2000
    db 0x8b, 0x04, 0x45, 0x70, 0x19, 0x0f, 0x00    ; mov eax, dword [eax*2 + 0xf1970]
    imul edx
    shrd eax, edx, cl
    movsx edx, word [0x6c6ee]
    mov ecx, eax
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    db 0x89, 0x0c, 0x45, 0x70, 0x19, 0x0f, 0x00    ; mov dword [eax*2 + 0xf1970], ecx
    jmp near loc_0aa6
loc_09b6:
    mov edx, dword [0x6c508]
    mov cx, word [edx + 0xe]
    cmp cx, 0x758
    je near loc_0aa6
    cmp cx, 0x60e
    je near loc_0aa6
    cmp cx, 0x780
    je near loc_0aa6
    movsx ecx, word [0x6c6ec]
    lea eax, [ecx*8]
    add eax, ecx
    lea eax, [eax*8]
    sub eax, ecx
    mov eax, dword [eax + 0x8b0e3]
    cmp eax, dword [edx + 8]
    jne short loc_0a17
    cmp dword [0x1261df], 2
    jge short loc_0a5a
    cmp dword [0x1261e3], 2
    jge short loc_0a5a
loc_0a17:
    mov eax, dword [0x6c504]
    test byte [eax], 1
    jne near loc_0b87
    movsx edx, word [0x6c6ee]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    mov cx, word [0x6c6ec]
    db 0x66, 0x3b, 0x0c, 0x45, 0x76, 0x1a, 0x0f, 0x00    ; cmp cx, word [eax*2 + 0xf1a76]
    je near loc_0b87
    mov eax, dword [0x6c508]
    add esi, esi
    jmp short loc_0aa0
loc_0a5a:
    mov eax, dword [0x6c504]
    test byte [eax], 3
    jne near loc_0b87
    movsx edx, word [0x6c6ee]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    mov dx, word [0x6c6ec]
    db 0x66, 0x3b, 0x14, 0x45, 0x76, 0x1a, 0x0f, 0x00    ; cmp dx, word [eax*2 + 0xf1a76]
    je near loc_0b87
    mov eax, dword [0x6c508]
    lea esi, [esi*4]
loc_0aa0:
    mov word [eax + 0x28], 0x101
loc_0aa6:
    mov eax, ebx
    and ah, 7
    cwde
    db 0x0f, 0xbf, 0x04, 0x45, 0xb4, 0x96, 0x24, 0x00    ; movsx eax, word [eax*2 + 0x2496b4]
    imul eax, esi
    movsx edx, bx
    add edx, 0x200
    and edx, 0x7ff
    db 0x0f, 0xbf, 0x14, 0x55, 0xb4, 0x96, 0x24, 0x00    ; movsx edx, word [edx*2 + 0x2496b4]
    imul edx, esi
    mov ecx, dword [0x6c508]
    push 0x10001
    movsx ecx, word [ecx + 0x24]
    movsx esi, word [0x6c6ec]
    sar eax, 0xe
    sar edx, 0xe
    mov ebx, eax
    mov eax, esi
    call 0x285d0
    movsx edx, word [0x6c6ec]
    mov ebx, eax
    lea eax, [edx*8]
    add eax, edx
    lea eax, [eax*8]
    sub eax, edx
    mov word [eax + 0x8b0c1], bx
loc_0b18:
    test di, di
    je short loc_0b87
    mov edx, dword [0x6c508]
    movsx ebx, word [edx + 0x18]
    lea eax, [ebx*4]
    add eax, ebx
    lea eax, [eax*8]
    test byte [eax + 0x2c9cc0], 1
    je short loc_0b49
    movsx ebx, byte [eax + 0x2c9cc8]
    jmp short loc_0b50
loc_0b49:
    movsx ebx, byte [eax + 0x2c9cd0]
loc_0b50:
    movsx eax, byte [edx + 0x10]
    sub ebx, eax
    sar ebx, 1
    add eax, ebx
    mov byte [edx + 0x10], al
    mov eax, dword [0x6c508]
    movsx edx, word [eax + 0x18]
    lea eax, [edx*4]
    add eax, edx
    cmp word [eax*8 + 0x2c9ccc], 0x230
    jne short loc_0b87
    movsx eax, word [0x6c6ec]
    call 0x67ff5
loc_0b87:
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
loc_0b8d:
    ret
    db 0x8b, 0xc0    ; mov eax, eax
    test eax, eax
    je short loc_0ba0
    add dword [0x121ecc], 8
    jmp near 0x38140
loc_0ba0:
    mov eax, dword [0x121ecc]
    mov eax, dword [eax + 4]
    mov dword [0x121ecc], eax
    cmp dword [eax], 0xa
    jne short loc_0b8d
    add eax, 8
    mov dword [0x121ecc], eax
    jmp near 0x38140
    nop
%else
loc_0000:
    push ebx
    push ecx
    push esi
    push edi
    push ebp
    sub esp, 0x20
    cwde
    imul eax, eax, 0x2c
    mov esi, 0x1c0ba4
    add esi, eax
    mov eax, 0x800
    movsx ebx, dx
    mov edx, eax
    sar edx, 0x1f
    idiv ebx
    mov ebp, 0xc0000000
    mov dx, word [esi + 0xe]
    mov dword [esp + 0x18], eax
    cmp dx, 0x214
    je short loc_0051
    mov eax, dword [0x3bce4]
    mov eax, dword [eax]
    and eax, 0x3f
    cmp eax, 2
    jle short loc_0051
    mov ax, word [esi + 0x1c]
    add ah, 4
    jmp near loc_0103
loc_0051:
    mov di, word [esi + 0x1c]
    jmp near loc_00e7
loc_005a:
    push 0x1000040
    lea edx, [esp + 4]
    push edx
    lea edx, [esp + 0xc]
    push edx
    lea edx, [esp + 0x14]
    push edx
    lea edx, [esp + 0x20]
    push edx
    lea edx, [esp + 0x28]
    push edx
    lea edx, [esp + 0x24]
    add eax, 0x200
    push edx
    mov edx, edi
    movsx ecx, word [esi + 0x18]
    and dh, 7
    and eax, 0x7ff
    movsx edx, dx
    push 0
    db 0x0f, 0xbf, 0x14, 0x55, 0xa4, 0x7f, 0x1b, 0x00    ; movsx edx, word [edx*2 + 0x1b7fa4]
    mov ebx, dword [esi + 8]
    push edx
    db 0x0f, 0xbf, 0x04, 0x45, 0xa4, 0x7f, 0x1b, 0x00    ; movsx eax, word [eax*2 + 0x1b7fa4]
    sub ebx, 0x800
    push eax
    mov edx, dword [esi + 4]
    mov eax, dword [esi]
    call 0x6b0c1
    mov eax, dword [esp + 8]
    sub eax, dword [esi]
    test eax, eax
    jns short loc_00c6
    neg eax
loc_00c6:
    mov ecx, eax
    mov ebx, dword [esi + 4]
    mov eax, dword [esp + 4]
    sub eax, ebx
    test eax, eax
    jns short loc_00d7
    neg eax
loc_00d7:
    add eax, ecx
    cmp eax, ebp
    jle short loc_00e3
    mov ebp, eax
    mov dword [esp + 0x1c], edi
loc_00e3:
    add edi, dword [esp + 0x18]
loc_00e7:
    movsx edx, word [esi + 0x1c]
    movsx eax, di
    add edx, 0x800
    cmp eax, edx
    jl near loc_005a
    mov eax, dword [esp + 0x1c]
    and ah, 7
loc_0103:
    add esp, 0x20
    pop ebp
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
    db 0x8d, 0x44, 0x20, 0x00    ; lea eax, [eax]
    push esi
    push edi
    push ebp
    sub esp, 0x24
    mov esi, edx
    mov ebp, ebx
    mov dword [esp + 0xc], ecx
    cwde
    imul eax, eax, 0x2c
    mov edi, 0x1c0ba4
    add edi, eax
    mov eax, dword [0x3bce4]
    test byte [eax], 0x3f
    jne near loc_02a5
    cmp dword [0xe97df], 2
    jge short loc_0153
    cmp dword [0xe97e3], 3
    jge short loc_0153
    mov dword [esp + 0x14], 0x400
    jmp short loc_016e
loc_0153:
    call 0x7079f
    and eax, 1
    lea ebx, [eax + 1]
    mov eax, 0x800
    mov edx, eax
    sar edx, 0x1f
    idiv ebx
    mov dword [esp + 0x14], eax
loc_016e:
    mov ax, word [esi + 0x1c]
    mov dword [esp + 0x18], eax
    jmp near loc_028f
loc_017b:
    push 0x1000040
    lea eax, [esp + 4]
    push eax
    lea eax, [esp + 0xc]
    push eax
    lea eax, [esp + 0x14]
    push eax
    lea eax, [esp + 0x2c]
    push eax
    lea eax, [esp + 0x24]
    push eax
    lea eax, [esp + 0x38]
    push eax
    mov ebx, 0x4000
    call 0x7079f
    and eax, 0x7fff
    sub ebx, eax
    mov eax, dword [esp + 0x34]
    and ah, 7
    cwde
    push ebx
    db 0x0f, 0xbf, 0x04, 0x45, 0xa4, 0x7f, 0x1b, 0x00    ; movsx eax, word [eax*2 + 0x1b7fa4]
    push eax
    lea eax, [edx + 0x200]
    and eax, 0x7ff
    movsx ecx, word [esi + 0x18]
    mov ebx, dword [esi + 8]
    db 0x0f, 0xbf, 0x04, 0x45, 0xa4, 0x7f, 0x1b, 0x00    ; movsx eax, word [eax*2 + 0x1b7fa4]
    sub ebx, 0x1000
    push eax
    mov edx, dword [esi + 4]
    mov eax, dword [esi]
    call 0x6b0c1
    mov eax, dword [esp + 8]
    sub eax, dword [esi]
    test eax, eax
    jns short loc_01f8
    neg eax
loc_01f8:
    mov edx, eax
    mov ebx, dword [esi + 4]
    mov eax, dword [esp + 4]
    sub eax, ebx
    test eax, eax
    jns short loc_0209
    neg eax
loc_0209:
    mov ecx, dword [edi]
    lea ebx, [edx + eax]
    mov eax, dword [esp + 8]
    sub eax, ecx
    test eax, eax
    jns short loc_021a
    neg eax
loc_021a:
    mov edx, eax
    mov ecx, dword [edi + 4]
    mov eax, dword [esp + 4]
    sub eax, ecx
    test eax, eax
    jns short loc_022b
    neg eax
loc_022b:
    add eax, edx
    cmp ebx, eax
    jge short loc_0277
    movsx eax, word [edi + 0x18]
    push eax
    mov eax, dword [edi + 8]
    sub eax, 0x1000
    push eax
    mov eax, dword [edi + 4]
    movsx ecx, word [esp + 0x28]
    push eax
    mov edx, dword [edi]
    mov ebx, dword [esp + 0xc]
    push edx
    mov eax, dword [esp + 0x18]
    mov edx, dword [esp + 0x14]
    call 0x6ae4d
    test eax, eax
    je short loc_0277
    mov eax, dword [esp + 8]
    mov dword [ebp], eax
    mov edx, dword [esp + 0xc]
    mov eax, dword [esp + 4]
    mov dword [edx], eax
    mov eax, dword [esp + 0x20]
    jmp short loc_02aa
loc_0277:
    call 0x7079f
    mov edx, dword [esp + 0x14]
    and ah, 1
    mov ebx, dword [esp + 0x18]
    sub edx, eax
    add ebx, edx
    mov dword [esp + 0x18], ebx
loc_028f:
    movsx eax, word [esi + 0x1c]
    movsx edx, word [esp + 0x18]
    add eax, 0x800
    cmp edx, eax
    jl near loc_017b
loc_02a5:
    mov eax, 0xffffffff
loc_02aa:
    add esp, 0x24
    pop ebp
    pop edi
    pop esi
    ret
    db 0x8d, 0x80, 0x00, 0x00, 0x00, 0x00    ; lea eax, [eax]
    db 0x8d, 0x92, 0x00, 0x00, 0x00, 0x00    ; lea edx, [edx]
    db 0x8d, 0x40, 0x00    ; lea eax, [eax]
loc_02c0:
    push ebx
    push ecx
    push edx
    push esi
    push edi
    push ebp
    sub esp, 8
    mov word [esp + 4], ax
    mov eax, dword [0x3bce4]
    mov ebp, 5
    mov ebx, dword [0x3bce8]
    mov esi, dword [eax + 4]
    mov edi, dword [eax]
    movsx ecx, word [ebx + 0x20]
    mov edx, dword [esi]
    mov ax, word [ebx + 0x1c]
    sub edx, ecx
    mov dword [esp], eax
    mov eax, edx
    sar edx, 0x1f
    idiv ebp
    add eax, ecx
    mov word [ebx + 0x20], ax
    mov ebx, dword [0x3bce8]
    mov dx, word [ebx + 0x24]
    and edi, 0x1f
    cmp dx, 0x288
    jge short loc_032c
    mov edx, dword [esi + 4]
    movsx ecx, word [ebx + 0x24]
    shl edx, 4
    sub edx, ecx
    mov eax, edx
    sar edx, 0x1f
    idiv ebp
    add eax, ecx
    mov word [ebx + 0x24], ax
loc_032c:
    test byte [esp + 5], 2
    je near loc_04e7
    movsx edx, word [0x3bece]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    db 0x66, 0x8b, 0x34, 0x45, 0x8e, 0x52, 0x0b, 0x00    ; mov si, word [eax*2 + 0xb528e]
    test si, si
    jl short loc_03a3
    mov eax, dword [0x3bce8]
    movsx edx, word [eax + 0x18]
    mov ebx, dword [eax + 4]
    mov ecx, dword [eax]
    push edx
    mov edx, dword [eax + 8]
    movsx eax, si
    imul eax, eax, 0x2c
    push edx
    push ebx
    push ecx
    movsx ecx, word [eax + 0x1c0bbc]
    mov ebx, dword [eax + 0x1c0bac]
    mov edx, dword [eax + 0x1c0ba8]
    mov eax, dword [eax + 0x1c0ba4]
    call 0x6ae4d
    test eax, eax
    je short loc_03a3
    mov eax, dword [0x3bce8]
    mov word [eax + 0x1e], si
    jmp short loc_03cc
loc_03a3:
    movsx edx, word [0x3bece]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    mov edx, dword [0x3bce8]
    db 0x66, 0x8b, 0x04, 0x45, 0x40, 0x52, 0x0b, 0x00    ; mov ax, word [eax*2 + 0xb5240]
    mov word [edx + 0x1e], ax
loc_03cc:
    mov edx, dword [0x3bce8]
    movsx ebx, word [edx + 0x1e]
    imul ebx, ebx, 0x2c
    cmp word [ebx + 0x1c0bb2], 0x214
    jne short loc_0418
    movsx ebx, word [0x3becc]
    lea ecx, [ebx*8]
    add ecx, ebx
    lea ecx, [ecx*8]
    sub ecx, ebx
    mov eax, dword [ecx + 0x4e9f7]
    mov ebx, dword [edx + 4]
    sub eax, ebx
    mov ebx, eax
    mov eax, dword [ecx + 0x4e9f3]
    mov ecx, dword [edx]
    mov edx, ebx
    sub eax, ecx
    jmp short loc_042f
loc_0418:
    mov ecx, dword [ebx + 0x1c0ba8]
    mov esi, dword [edx + 4]
    mov eax, dword [ebx + 0x1c0ba4]
    mov ebp, dword [edx]
    sub ecx, esi
    sub eax, ebp
    mov edx, ecx
loc_042f:
    call 0x65698
    mov esi, eax
    mov eax, dword [0x3bce8]
    cmp word [eax + 0x20], 0
    je near loc_04de
    cmp word [eax + 0xe], 0x758
    je near loc_04de
    movsx eax, word [esp]
    movsx edx, si
    call 0x374b0
    cmp edi, 2
    jge short loc_04ad
    cwde
    test eax, eax
    jns short loc_046a
    neg eax
loc_046a:
    cmp eax, 0x100
    jge near loc_04e7
    call 0x7079f
    xor al, al
    mov esi, 0x80
    and ah, 1
    sub esi, eax
    mov eax, dword [0x3bce8]
    add word [eax + 0x1c], si
    movsx eax, word [0x3becc]
    call 0x480a0
    cmp eax, 0x34c
    jge short loc_04e7
    mov eax, dword [0x3bce8]
    sub word [eax + 0x1c], si
    jmp short loc_04e7
loc_04ad:
    cmp edi, 0x12
    jle short loc_04e7
    cmp edi, 0x1a
    jge short loc_04e7
    movsx edx, ax
    sar edx, 2
    mov eax, edx
    test eax, eax
    jns short loc_04c5
    neg eax
loc_04c5:
    cmp eax, 0x80
    jl short loc_04de
    mov ebx, dword [0x3bce8]
    movsx eax, word [ebx + 0x1c]
    add eax, edx
    mov word [ebx + 0x1c], ax
    jmp short loc_04e7
loc_04de:
    mov eax, dword [0x3bce8]
    mov word [eax + 0x1c], si
loc_04e7:
    cmp edi, 1
    jge short loc_055f
    mov dl, byte [esp + 5]
    mov esi, 2
    test dl, 4
    je short loc_053f
    mov edx, 2
    movsx eax, word [0x3becc]
    call loc_0000
    mov edx, dword [0x3bce8]
    mov word [edx + 0x1c], ax
    movsx edx, word [0x3bece]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    lea edx, [eax + eax]
    mov eax, dword [0x3bce8]
    mov dx, word [edx + 0xb5240]
    mov word [eax + 0x1e], dx
loc_053f:
    test byte [esp + 4], 0x80
    je short loc_055f
    movsx eax, word [0x3becc]
    movsx edx, si
    call loc_0000
    mov edx, dword [0x3bce8]
    mov word [edx + 0x1c], ax
loc_055f:
    add esp, 8
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    db 0x8d, 0x80, 0x00, 0x00, 0x00, 0x00    ; lea eax, [eax]
    nop
    push ebx
    push ecx
    push edx
    push esi
    push edi
    push ebp
    sub esp, 4
    mov eax, dword [0x3bce8]
    mov ax, word [eax + 0x28]
    mov word [esp], ax
    cwde
    cmp eax, -1
    jne short loc_0592
    xor edx, edx
    mov word [esp], dx
loc_0592:
    mov eax, dword [0x3bce4]
    inc dword [eax]
    test byte [esp], 1
    je near loc_0632
    movsx edx, word [0x3bece]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    add eax, eax
    cmp word [eax + 0xb521e], 0
    jl short loc_05e3
    mov ebx, dword [0x3bce8]
    mov edx, dword [eax + 0xb513c]
    mov edi, dword [ebx + 4]
    mov eax, dword [eax + 0xb5138]
    mov ebp, dword [ebx]
    sub edx, edi
    sub eax, ebp
    jmp short loc_05fe
loc_05e3:
    mov ebx, dword [0x3bce8]
    mov edx, dword [eax + 0xb5118]
    mov ecx, dword [ebx + 4]
    mov eax, dword [eax + 0xb5114]
    mov esi, dword [ebx]
    sub edx, ecx
    sub eax, esi
loc_05fe:
    call 0x65698
    mov esi, eax
    mov eax, dword [0x3bce8]
    movsx edx, si
    movsx eax, word [eax + 0x1c]
    call 0x374b0
    cwde
    sar eax, 2
    mov ebx, eax
    cwde
    cmp eax, -8
    jle short loc_0629
    test bx, bx
    jge short loc_0629
    xor ebx, ebx
loc_0629:
    mov eax, dword [0x3bce8]
    add word [eax + 0x1c], bx
loc_0632:
    test byte [esp], 0x20
    je short loc_0668
    mov ebx, dword [0x3bce4]
    mov ebx, dword [ebx]
    lea ebx, [ebx*8]
    and ebx, 0x7ff
    mov edx, dword [0x3bce8]
    db 0x0f, 0xbf, 0x1c, 0x5d, 0xa4, 0x7f, 0x1b, 0x00    ; movsx ebx, word [ebx*2 + 0x1b7fa4]
    movsx eax, word [edx + 0x1c]
    sar ebx, 6
    add eax, ebx
    mov word [edx + 0x1c], ax
loc_0668:
    test byte [esp], 0x10
    je near loc_0716
    movsx edx, word [0x3bece]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    add eax, eax
    cmp word [eax + 0xb521e], 0
    jl short loc_06b2
    mov ebx, dword [0x3bce8]
    mov edx, dword [eax + 0xb513c]
    mov edi, dword [ebx + 4]
    mov eax, dword [eax + 0xb5138]
    mov ebp, dword [ebx]
    sub edx, edi
    sub eax, ebp
    jmp short loc_06cd
loc_06b2:
    mov ebx, dword [0x3bce8]
    mov edx, dword [eax + 0xb5118]
    mov ecx, dword [ebx + 4]
    mov eax, dword [eax + 0xb5114]
    mov esi, dword [ebx]
    sub edx, ecx
    sub eax, esi
loc_06cd:
    call 0x65698
    mov esi, eax
    mov eax, dword [0x3bce8]
    movsx edx, si
    movsx eax, word [eax + 0x1c]
    call 0x374b0
    movsx ebx, ax
    add ebx, ebx
    sbb eax, eax
    cmp eax, ebx
    adc al, 0
    mov ebx, eax
    shl ebx, 5
    movsx eax, bx
    cmp eax, -0x20
    jle short loc_070d
    test bx, bx
    jge short loc_070d
    mov eax, dword [0x3bce8]
    xor ebx, ebx
    mov word [eax + 0x1c], si
loc_070d:
    mov eax, dword [0x3bce8]
    add word [eax + 0x1c], bx
loc_0716:
    mov eax, dword [esp]
    and eax, 0x101
    cmp ax, 0x101
    jne short loc_075a
    mov eax, dword [0x3bce4]
    cmp dword [eax], 0x10
    jge short loc_075a
    mov ebx, dword [eax]
    shl ebx, 4
    add ebx, 0x200
    and ebx, 0x7ff
    mov edx, dword [0x3bce8]
    db 0x0f, 0xbf, 0x1c, 0x5d, 0xa4, 0x7f, 0x1b, 0x00    ; movsx ebx, word [ebx*2 + 0x1b7fa4]
    movsx eax, word [edx + 0x24]
    sar ebx, 5
    sub eax, ebx
    mov word [edx + 0x24], ax
loc_075a:
    test byte [esp], 0x40
    je near loc_07ee
    movsx edx, word [0x3bece]
    mov esi, edx
    shl esi, 7
    sub esi, edx
    lea esi, [esi*4]
    sub esi, edx
    add esi, esi
    mov eax, dword [esi + 0xb514c]
    mov edx, eax
    mov ebx, 0x300
    sar edx, 0x1f
    idiv ebx
    mov ecx, dword [esi + 0xb5114]
    add ecx, eax
    mov eax, dword [esi + 0xb5150]
    mov edx, eax
    sar edx, 0x1f
    idiv ebx
    mov edx, dword [esi + 0xb5118]
    add edx, eax
    mov eax, dword [0x3bce8]
    mov ebx, dword [eax + 4]
    mov esi, dword [eax]
    mov eax, ecx
    sub edx, ebx
    sub eax, esi
    call 0x65698
    movsx edx, ax
    mov eax, dword [0x3bce8]
    movsx eax, word [eax + 0x1c]
    call 0x374b0
    cwde
    sar eax, 2
    mov ebx, eax
    cwde
    cmp eax, -8
    jle short loc_07e5
    test bx, bx
    jge short loc_07e5
    xor ebx, ebx
loc_07e5:
    mov eax, dword [0x3bce8]
    add word [eax + 0x1c], bx
loc_07ee:
    mov eax, dword [0x3bce4]
    mov edi, dword [eax + 4]
    test edi, edi
    je short loc_0805
    cmp word [esp], 0
    jne near loc_089f
loc_0805:
    mov eax, dword [0x3bce8]
    call 0x12be0
    test ax, ax
    je short loc_0820
    mov eax, dword [0x3bce8]
    cmp word [eax + 0x2a], 0
    jle short loc_0859
loc_0820:
    movsx edx, word [0x3becc]
    lea eax, [edx*8]
    add eax, edx
    lea eax, [eax*8]
    sub eax, edx
    mov edx, eax
    mov eax, dword [0x3bce8]
    mov ebx, dword [edx + 0x4e9fb]
    cmp ebx, dword [eax]
    jne short loc_0859
    mov edx, dword [edx + 0x4e9ff]
    cmp edx, dword [eax + 4]
    je near loc_0ed8
loc_0859:
    movsx esi, word [0x3becc]
    lea eax, [esi*8]
    add eax, esi
    lea eax, [eax*8]
    mov edx, dword [0x3bce8]
    sub eax, esi
    mov ebx, dword [edx]
    mov dword [eax + 0x4e9fb], ebx
    mov ebx, dword [edx + 4]
    mov dword [eax + 0x4e9ff], ebx
    mov eax, esi
    mov ecx, dword [edx + 8]
    mov edx, dword [edx]
    call 0x6a826
    add esp, 4
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
loc_089f:
    mov bh, byte [esp]
    mov eax, edi
    test bh, 2
    je short loc_08bf
    mov edx, dword [0x3bce8]
    mov ecx, dword [edi]
    movsx ebx, word [edx + 0x20]
    sub ecx, ebx
    sar ecx, 1
    add ebx, ecx
    mov word [edx + 0x20], bx
loc_08bf:
    test byte [esp], 4
    je short loc_08df
    mov ebx, dword [eax + 4]
    mov edx, dword [0x3bce8]
    shl ebx, 4
    movsx eax, word [edx + 0x24]
    sub ebx, eax
    sar ebx, 1
    add eax, ebx
    mov word [edx + 0x24], ax
loc_08df:
    test byte [esp + 1], 0x10
    je short loc_08f0
    mov eax, dword [0x3bce8]
    call 0x39c40
loc_08f0:
    mov eax, dword [0x3bce8]
    cmp word [eax + 0xe], 0x214
    je short loc_0906
    movsx eax, word [esp]
    call loc_02c0
loc_0906:
    mov eax, dword [0x3bce8]
    movsx edx, word [eax + 0x20]
    cmp edx, -6
    jle short loc_0921
    cmp word [eax + 0x20], 6
    jge short loc_0921
    mov word [eax + 0x20], 0
loc_0921:
    mov eax, dword [0x3bce8]
    call 0x12be0
    mov word [esp], ax
    mov eax, dword [0x3bce8]
    cmp word [eax + 0x20], 0
    jne short loc_0946
    cmp word [eax + 0x24], 0
    je near loc_0e66
loc_0946:
    cmp word [esp], 0
    je near loc_0b7b
    mov eax, dword [0x3bce8]
    mov cx, word [eax + 0xe]
    cmp cx, 0x938
    je near loc_0b7b
    cmp cx, 0x758
    je short loc_0977
    cmp cx, 0x780
    jne near loc_0af7
loc_0977:
    mov eax, dword [0x3bce8]
    cmp word [eax + 0x2a], 0
    jle near loc_0af7
    cmp word [eax + 0xe], 0x780
    jne near loc_0a47
    mov ebx, dword [eax + 4]
    mov edx, dword [eax]
    movsx eax, word [eax + 0x18]
    call 0x7739f
    movsx edx, word [0x3becc]
    mov ecx, eax
    lea eax, [edx*8]
    add eax, edx
    lea eax, [eax*8]
    sub eax, edx
    mov dword [eax + 0x4e9eb], ecx
    mov eax, dword [0x3bce8]
    sub ecx, 0x800
    mov edi, dword [eax + 8]
    cmp ecx, edi
    jge short loc_09e4
    jge short loc_09d9
    mov dword [eax + 8], ecx
loc_09d9:
    mov eax, dword [0x3bce8]
    mov word [eax + 0x24], 0
loc_09e4:
    mov eax, dword [0x3bce8]
    mov ebx, dword [eax + 4]
    mov edx, dword [eax]
    movsx eax, word [eax + 0x18]
    call 0x772c1
    movsx ecx, word [0x3becc]
    mov edx, eax
    lea eax, [ecx*8]
    add eax, ecx
    lea eax, [eax*8]
    sub eax, ecx
    mov dword [eax + 0x4e9ef], edx
    mov eax, dword [0x3bce8]
    mov ebx, dword [eax + 8]
    sub ebx, edx
    cmp ebx, 0x5000
    jge near loc_0bbf
    add edx, 0x5000
    mov dword [eax + 8], edx
    mov eax, dword [0x3bce8]
    mov word [eax + 0x24], 0
    jmp near loc_0bbf
loc_0a47:
    cmp word [eax + 0x24], 0
    jle short loc_0a99
    mov ebx, dword [eax + 4]
    mov edx, dword [eax]
    movsx eax, word [eax + 0x18]
    call 0x7739f
    movsx edx, word [0x3becc]
    mov ecx, eax
    lea eax, [edx*8]
    add eax, edx
    lea eax, [eax*8]
    sub eax, edx
    mov dword [eax + 0x4e9eb], ecx
    mov eax, dword [0x3bce8]
    sub ecx, 0x1e00
    cmp ecx, dword [eax + 8]
    jge near loc_0bbf
    mov dword [eax + 8], ecx
    jmp near loc_0bbf
loc_0a99:
    mov ebx, dword [eax + 4]
    mov edx, dword [eax]
    movsx eax, word [eax + 0x18]
    call 0x772c1
    movsx ecx, word [0x3becc]
    mov edx, eax
    lea eax, [ecx*8]
    add eax, ecx
    lea eax, [eax*8]
    sub eax, ecx
    mov dword [eax + 0x4e9ef], edx
    mov eax, dword [0x3bce8]
    mov ebx, dword [eax + 8]
    sub ebx, edx
    cmp ebx, 0x3200
    jge near loc_0bbf
    add edx, 0x3200
    mov dword [eax + 8], edx
    mov eax, dword [0x3bce8]
    mov word [eax + 0x24], 0
    jmp near loc_0bbf
loc_0af7:
    mov edx, dword [0x3bce8]
    cmp word [edx + 0xe], 0x974
    je near loc_0bbf
    cmp word [edx + 0x24], 0
    jle short loc_0b37
    movsx ecx, word [0x3becc]
    lea eax, [ecx*8]
    add eax, ecx
    lea eax, [eax*8]
    sub eax, ecx
    mov ebx, dword [eax + 0x4e9eb]
    cmp ebx, dword [edx + 8]
    jge short loc_0b37
    mov dword [edx + 8], ebx
loc_0b37:
    mov eax, dword [0x3bce8]
    cmp word [eax + 0x24], 0
    jge near loc_0bbf
    mov ebx, dword [eax + 4]
    mov edx, dword [eax]
    movsx eax, word [eax + 0x18]
    call 0x772c1
    mov edx, dword [0x3bce8]
    mov ebx, dword [edx + 8]
    sub ebx, eax
    cmp ebx, 0x4200
    jge short loc_0bbf
    add eax, 0x4200
    mov dword [edx + 8], eax
    mov eax, dword [0x3bce8]
    sar word [eax + 0x24], 1
    jmp short loc_0bbf
loc_0b7b:
    mov ecx, dword [0x3bce8]
    cmp word [ecx + 0xe], 0x214
    jne short loc_0bbf
    movsx edx, word [0x3becc]
    lea eax, [edx*8]
    add eax, edx
    lea eax, [eax*8]
    sub eax, edx
    mov edx, eax
    mov eax, dword [ecx + 8]
    mov ebp, dword [edx + 0x4e9ef]
    sub eax, ebp
    cmp eax, 0x2000
    jge short loc_0bbf
    lea eax, [ebp + 0x2000]
    mov dword [ecx + 8], eax
loc_0bbf:
    mov edx, dword [0x3bce8]
    mov edi, dword [esp]
    movsx esi, word [edx + 0x20]
    mov bx, word [edx + 0x1c]
    test di, di
    je near loc_0df8
    cmp word [edx + 0xe], 0x938
    je near loc_0df8
    cmp dword [0x3bcec], 0x3c0
    jge near loc_0d18
    cmp byte [edx + 0x14], 0x10
    jbe near loc_0d18
    movsx ecx, word [0x3bece]
    mov ebx, ecx
    shl ebx, 7
    sub ebx, ecx
    lea ebx, [ebx*4]
    mov esi, 0x400
    sub ebx, ecx
    mov eax, dword [0x3bcec]
    add ebx, ebx
    sub esi, eax
    mov ecx, dword [edx + 4]
    mov eax, dword [ebx + 0xb5118]
    sub eax, ecx
    mov edi, dword [edx]
    mov ecx, eax
    mov eax, dword [ebx + 0xb5114]
    mov edx, ecx
    sub eax, edi
    neg esi
    call 0x65698
    mov ebp, dword [0x3bcec]
    mov ebx, eax
    cmp ebp, 0x200
    jge short loc_0c80
    movsx edx, word [0x3bece]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    xor edx, edx
    db 0x89, 0x14, 0x45, 0x4c, 0x51, 0x0b, 0x00    ; mov dword [eax*2 + 0xb514c], edx
    db 0x89, 0x14, 0x45, 0x50, 0x51, 0x0b, 0x00    ; mov dword [eax*2 + 0xb5150], edx
    jmp near loc_0df8
loc_0c80:
    movsx edx, word [0x3bece]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    mov edi, dword [0x8d5c]
    lea eax, [eax*4]
    sub edi, 0x2000
    sub eax, edx
    mov ecx, 0x10
    mov edx, edi
    db 0x8b, 0x04, 0x45, 0x4c, 0x51, 0x0b, 0x00    ; mov eax, dword [eax*2 + 0xb514c]
    imul edx
    shrd eax, edx, cl
    movsx edx, word [0x3bece]
    mov ecx, eax
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    mov edx, dword [0x8d5c]
    db 0x89, 0x0c, 0x45, 0x4c, 0x51, 0x0b, 0x00    ; mov dword [eax*2 + 0xb514c], ecx
    mov ecx, 0x10
    sub edx, 0x2000
    db 0x8b, 0x04, 0x45, 0x50, 0x51, 0x0b, 0x00    ; mov eax, dword [eax*2 + 0xb5150]
    imul edx
    shrd eax, edx, cl
    movsx edx, word [0x3bece]
    mov ecx, eax
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    db 0x89, 0x0c, 0x45, 0x50, 0x51, 0x0b, 0x00    ; mov dword [eax*2 + 0xb5150], ecx
    jmp near loc_0df8
loc_0d18:
    mov edx, dword [0x3bce8]
    mov cx, word [edx + 0xe]
    cmp cx, 0x758
    je near loc_0df8
    cmp cx, 0x60e
    je near loc_0df8
    cmp cx, 0x780
    je near loc_0df8
    movsx ecx, word [0x3becc]
    lea eax, [ecx*8]
    add eax, ecx
    lea eax, [eax*8]
    sub eax, ecx
    mov eax, dword [eax + 0x4ea03]
    cmp eax, dword [edx + 8]
    jne short loc_0d79
    cmp dword [0xe97df], 2
    jge short loc_0db7
    cmp dword [0xe97e3], 2
    jge short loc_0db7
loc_0d79:
    mov eax, dword [0x3bce4]
    test byte [eax], 1
    jne near loc_0ed8
    movsx edx, word [0x3bece]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    mov cx, word [0x3becc]
    db 0x66, 0x3b, 0x0c, 0x45, 0x56, 0x52, 0x0b, 0x00    ; cmp cx, word [eax*2 + 0xb5256]
    je near loc_0ed8
    add esi, esi
    jmp short loc_0df8
loc_0db7:
    mov eax, dword [0x3bce4]
    test byte [eax], 3
    jne near loc_0ed8
    movsx edx, word [0x3bece]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    mov dx, word [0x3becc]
    db 0x66, 0x3b, 0x14, 0x45, 0x56, 0x52, 0x0b, 0x00    ; cmp dx, word [eax*2 + 0xb5256]
    je near loc_0ed8
    lea esi, [esi*4]
loc_0df8:
    mov eax, ebx
    and ah, 7
    cwde
    db 0x0f, 0xbf, 0x3c, 0x45, 0xa4, 0x7f, 0x1b, 0x00    ; movsx edi, word [eax*2 + 0x1b7fa4]
    imul edi, esi
    movsx eax, bx
    add eax, 0x200
    and eax, 0x7ff
    db 0x0f, 0xbf, 0x14, 0x45, 0xa4, 0x7f, 0x1b, 0x00    ; movsx edx, word [eax*2 + 0x1b7fa4]
    imul edx, esi
    mov ecx, dword [0x3bce8]
    push 0x10001
    movsx ecx, word [ecx + 0x24]
    sar edi, 0xe
    movsx eax, word [0x3becc]
    mov ebx, edi
    sar edx, 0xe
    call 0x28220
    movsx edx, word [0x3becc]
    mov ebx, eax
    lea eax, [edx*8]
    add eax, edx
    lea eax, [eax*8]
    sub eax, edx
    mov word [eax + 0x4e9e1], bx
loc_0e66:
    cmp word [esp], 0
    je short loc_0ed8
    mov edx, dword [0x3bce8]
    movsx ecx, word [edx + 0x18]
    lea eax, [ecx*4]
    add eax, ecx
    lea eax, [eax*8]
    test byte [eax + 0x2385b0], 1
    je short loc_0e99
    movsx ebx, byte [eax + 0x2385b8]
    jmp short loc_0ea0
loc_0e99:
    movsx ebx, byte [eax + 0x2385c0]
loc_0ea0:
    movsx eax, byte [edx + 0x10]
    sub ebx, eax
    sar ebx, 1
    add eax, ebx
    mov byte [edx + 0x10], al
    mov edx, dword [0x3bce8]
    movsx edx, word [edx + 0x18]
    lea eax, [edx*4]
    add eax, edx
    cmp word [eax*8 + 0x2385bc], 0x230
    jne short loc_0ed8
    movsx eax, word [0x3becc]
    call 0x6ab35
loc_0ed8:
    add esp, 4
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
loc_0ee1:
    ret
    db 0x8d, 0x80, 0x00, 0x00, 0x00, 0x00    ; lea eax, [eax]
    db 0x8d, 0x92, 0x00, 0x00, 0x00, 0x00    ; lea edx, [edx]
    db 0x8b, 0xc0    ; mov eax, eax
    test eax, eax
    je short loc_0f00
    add dword [0xe54cc], 8
    jmp near 0x3aed0
loc_0f00:
    mov eax, dword [0xe54cc]
    mov eax, dword [eax + 4]
    mov dword [0xe54cc], eax
    cmp dword [eax], 0xa
    jne short loc_0ee1
    add eax, 8
    mov dword [0xe54cc], eax
    jmp near 0x3aed0
    nop
%endif
