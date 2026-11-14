; HUD panel tile and value rendering.
bits 32
org START_ADDRESS

    push esi
    push edi
    push ebp
    sub esp, 0x5c
    mov ebp, edx
    mov dword [esp + 0x54], ebx
    mov dword [esp + 0x58], ecx
    mov ecx, 0x14
    mov edi, esp
    mov esi, 0x60
    db 0xf3, 0xa5    ; rep movsd dword es:[edi], dword [esi]
    mov edx, dword [YDIM]
    dec edx
    push edx
    mov edx, dword [XDIM]
    dec edx
    push edx
    cwde
    push 0
    add eax, 0xbc3
    push 0
    movzx edi, byte [esp + 0x80]
    push 0x8a
    mov esi, ebx
    xor ecx, ecx
    push 7
    lea edx, [edi - 0xa]
    mov ebx, 0x10000
    push edx
    shl esi, 0x10
    push eax
    lea eax, [ebp - 7]
    mov edx, esi
    shl eax, 0x10
    call LINK_ADDRESS_3
    mov eax, dword [YDIM]
    dec eax
    push eax
    mov eax, dword [XDIM]
    dec eax
    push eax
    push 0
    push 0
    push 0x8a
    push 0
    mov ebx, 0x10000
    mov edx, esi
    push edi
    xor ecx, ecx
    lea eax, [ebp - 3]
    push 0xbcc
    shl eax, 0x10
    call LINK_ADDRESS_3
    mov eax, dword [YDIM]
    dec eax
    push eax
    mov eax, dword [XDIM]
    dec eax
    push eax
    push 0
    push 0
    push 0x8a
    push 0
    mov ebx, 0x10000
    mov edx, esi
    push edi
    xor ecx, ecx
    lea eax, [ebp + 9]
    push 0xbcd
    shl eax, 0x10
    call LINK_ADDRESS_3
    cmp dword [esp + 0x58], 0x63
    jle short loc_00da
    mov dword [esp + 0x58], 0x63
loc_00da:
    cmp dword [esp + 0x6c], 0x63
    jle short loc_00e9
    mov dword [esp + 0x6c], 0x63
loc_00e9:
    mov edi, dword [esp + 0x58]
    push edi
    push LINK_ADDRESS_4
    lea eax, [esp + 8]
    push eax
    lea edi, [ebp + 4]
    call SPRINTF
    shl edi, 0x10
    mov eax, dword [XDIM]
    add esp, 0xc
    mov edx, dword [YDIM]
    mov esi, dword [esp + 0x54]
    mov ebx, dword [esp + 0x58]
    dec eax
    dec edx
    shl esi, 0x10
    cmp ebx, 9
    jle short loc_0192
    push edx
    push eax
    push 0
    push 0
    xor eax, eax
    push 0x8a
    mov al, byte [esp + 0x84]
    push 0
    mov dword [esp + 0x68], eax
    push eax
    xor eax, eax
    mov al, byte [esp + 0x1c]
    mov ebx, 0x10000
    add eax, 0xb92
    xor ecx, ecx
    push eax
    mov eax, ebp
    mov edx, esi
    shl eax, 0x10
    call LINK_ADDRESS_3
    mov eax, dword [YDIM]
    dec eax
    push eax
    mov eax, dword [XDIM]
    dec eax
    push eax
    push 0
    push 0
    push 0x8a
    push 0
    mov eax, dword [esp + 0x68]
    push eax
    xor eax, eax
    mov al, byte [esp + 0x1d]
    mov ebx, 0x10000
    add eax, 0xb92
    mov edx, esi
    push eax
    xor ecx, ecx
    jmp short loc_01be
loc_0192:
    push edx
    push eax
    push 0
    push 0
    push 0x8a
    xor eax, eax
    push 0
    mov al, byte [esp + 0x88]
    push eax
    xor eax, eax
    mov al, byte [esp + 0x1c]
    mov ebx, 0x10000
    add eax, 0xb92
    xor ecx, ecx
    push eax
    mov edx, esi
loc_01be:
    mov eax, edi
    call LINK_ADDRESS_3
    mov edx, dword [esp + 0x6c]
    push edx
    push LINK_ADDRESS_4
    lea eax, [esp + 8]
    push eax
    call SPRINTF
    mov ebx, dword [XDIM]
    mov edx, dword [YDIM]
    add esp, 0xc
    lea eax, [ebp + 0xd]
    mov esi, dword [esp + 0x54]
    mov ecx, dword [esp + 0x6c]
    dec ebx
    dec edx
    shl eax, 0x10
    shl esi, 0x10
    cmp ecx, 9
    jle short loc_0268
    push edx
    push ebx
    push 0
    push 0
    push 0x8a
    xor edx, edx
    push 0
    movzx edi, byte [esp + 0x88]
    mov dl, byte [esp + 0x18]
    push edi
    add edx, 0xb92
    xor ecx, ecx
    push edx
    mov ebx, 0x10000
    mov edx, esi
    call LINK_ADDRESS_3
    mov eax, dword [YDIM]
    dec eax
    push eax
    mov eax, dword [XDIM]
    dec eax
    push eax
    push 0
    push 0
    push 0x8a
    xor eax, eax
    push 0
    mov ebx, 0x10000
    mov al, byte [esp + 0x19]
    push edi
    add eax, 0xb92
    mov edx, esi
    push eax
    lea eax, [ebp + 0x11]
    xor ecx, ecx
    shl eax, 0x10
    jmp short loc_0295
loc_0268:
    push edx
    push ebx
    push 0
    push 0
    push 0x8a
    xor edx, edx
    push 0
    mov dl, byte [esp + 0x88]
    push edx
    xor edx, edx
    mov dl, byte [esp + 0x1c]
    add edx, 0xb92
    xor ecx, ecx
    push edx
    mov ebx, 0x10000
    mov edx, esi
loc_0295:
    call LINK_ADDRESS_3
    add esp, 0x5c
    pop ebp
    pop edi
    pop esi
    ret 8
    db 0x8d, 0x80, 0x00, 0x00, 0x00, 0x00    ; lea eax, [eax]
    db 0x8d, 0x92, 0x00, 0x00, 0x00, 0x00    ; lea edx, [edx]
    nop
    push esi
    push edi
    push ebp
    sub esp, 0x68
    mov ebp, edx
    mov dword [esp + 0x58], ebx
    mov dword [esp + 0x60], ecx
    mov ecx, 0x14
    mov edi, esp
    mov esi, 0xb0
    db 0xf3, 0xa5    ; rep movsd dword es:[edi], dword [esi]
    mov edx, dword [YDIM]
    dec edx
    push edx
    mov edx, dword [XDIM]
    dec edx
    push edx
    push 0
    push 0
    push 0x8a
    movzx edi, byte [esp + 0x90]
    push 7
    lea edx, [edi - 0xa]
    push edx
    and eax, 0xff
    mov esi, ebx
    xor ecx, ecx
    mov ebx, 0x10000
    add eax, 0xbc3
    shl esi, 0x10
    push eax
    lea eax, [ebp - 7]
    mov edx, esi
    shl eax, 0x10
    call LINK_ADDRESS_3
    mov eax, dword [YDIM]
    dec eax
    push eax
    mov eax, dword [XDIM]
    dec eax
    push eax
    push 0
    push 0
    push 0x8a
    push 0
    mov ebx, 0x10000
    mov edx, esi
    push edi
    xor ecx, ecx
    lea eax, [ebp - 4]
    push 0xbcc
    shl eax, 0x10
    call LINK_ADDRESS_3
    mov eax, dword [YDIM]
    dec eax
    push eax
    mov eax, dword [XDIM]
    dec eax
    push eax
    push 0
    push 0
    push 0x8a
    push 0
    mov ebx, 0x10000
    mov edx, esi
    push edi
    xor ecx, ecx
    lea eax, [ebp + 0xd]
    push 0xbcd
    shl eax, 0x10
    call LINK_ADDRESS_3
    mov edx, dword [esp + 0x60]
    push edx
    push LINK_ADDRESS_4
    lea eax, [esp + 8]
    lea ebx, [ebp + 8]
    push eax
    shl ebx, 0x10
    call SPRINTF
    mov eax, ebp
    add esp, 0xc
    add eax, 4
    mov edx, dword [YDIM]
    mov dword [esp + 0x50], eax
    mov dword [esp + 0x64], ebx
    mov ebx, dword [esp + 0x50]
    dec edx
    shl ebx, 0x10
    mov eax, dword [XDIM]
    mov dword [esp + 0x5c], ebx
    mov ebx, dword [esp + 0x60]
    dec eax
    cmp ebx, 0x63
    jle near loc_0467
    push edx
    push eax
    push 0
    push 0
    push 0x8a
    xor eax, eax
    push 0
    mov ebx, 0x10000
    mov al, byte [esp + 0x18]
    push edi
    add eax, 0xb92
    xor ecx, ecx
    push eax
    mov eax, ebp
    mov edx, esi
    shl eax, 0x10
    call LINK_ADDRESS_3
    mov eax, dword [YDIM]
    dec eax
    push eax
    mov eax, dword [XDIM]
    dec eax
    push eax
    push 0
    push 0
    push 0x8a
    xor eax, eax
    push 0
    mov ebx, 0x10000
    mov al, byte [esp + 0x19]
    push edi
    add eax, 0xb92
    mov edx, esi
    push eax
    xor ecx, ecx
    mov eax, dword [esp + 0x7c]
    call LINK_ADDRESS_3
    mov eax, dword [YDIM]
    dec eax
    push eax
    mov eax, dword [XDIM]
    dec eax
    push eax
    push 0
    push 0
    push 0x8a
    xor eax, eax
    push 0
    mov ebx, 0x10000
    mov al, byte [esp + 0x1a]
    push edi
    add eax, 0xb92
    mov edx, esi
    push eax
    xor ecx, ecx
    jmp near loc_04ec
loc_0467:
    cmp ebx, 9
    jle short loc_04c9
    push edx
    push eax
    push 0
    push 0
    push 0x8a
    xor eax, eax
    push 0
    mov ebx, 0x10000
    mov al, byte [esp + 0x18]
    push edi
    add eax, 0xb92
    xor ecx, ecx
    push eax
    mov edx, esi
    mov eax, dword [esp + 0x7c]
    call LINK_ADDRESS_3
    mov eax, dword [YDIM]
    dec eax
    push eax
    mov eax, dword [XDIM]
    dec eax
    push eax
    push 0
    push 0
    push 0x8a
    xor eax, eax
    push 0
    mov ebx, 0x10000
    mov al, byte [esp + 0x19]
    push edi
    add eax, 0xb92
    mov edx, esi
    push eax
    xor ecx, ecx
    jmp short loc_04ec
loc_04c9:
    push edx
    push eax
    push 0
    push 0
    push 0x8a
    xor eax, eax
    push 0
    mov ebx, 0x10000
    mov al, byte [esp + 0x18]
    push edi
    add eax, 0xb92
    xor ecx, ecx
    push eax
    mov edx, esi
loc_04ec:
    mov eax, dword [esp + 0x84]
    call LINK_ADDRESS_3
    mov esi, dword [esp + 0x78]
    push esi
    push LINK_ADDRESS_4
    lea eax, [esp + 8]
    lea edi, [ebp + 0x19]
    push eax
    shl edi, 0x10
    call SPRINTF
    mov ebx, dword [XDIM]
    mov edx, dword [YDIM]
    add esp, 0xc
    lea eax, [ebp + 0x15]
    mov esi, dword [esp + 0x58]
    lea ecx, [ebp + 0x11]
    dec ebx
    dec edx
    mov ebp, eax
    shl esi, 0x10
    shl ebp, 0x10
    mov eax, ecx
    mov ecx, dword [esp + 0x78]
    shl eax, 0x10
    cmp ecx, 0x63
    jle near loc_05fa
    push edx
    push ebx
    push 0
    push 0
    xor edx, edx
    push 0x8a
    mov dl, byte [esp + 0x90]
    push 0
    mov dword [esp + 0x6c], edx
    push edx
    xor edx, edx
    mov dl, byte [esp + 0x1c]
    add edx, 0xb92
    xor ecx, ecx
    push edx
    mov ebx, 0x10000
    mov edx, esi
    call LINK_ADDRESS_3
    mov eax, dword [YDIM]
    dec eax
    push eax
    mov eax, dword [XDIM]
    dec eax
    push eax
    push 0
    push 0
    push 0x8a
    mov ebx, dword [esp + 0x68]
    xor eax, eax
    push 0
    mov edx, esi
    mov al, byte [esp + 0x19]
    push ebx
    add eax, 0xb92
    xor ecx, ecx
    push eax
    mov ebx, 0x10000
    mov eax, ebp
    call LINK_ADDRESS_3
    mov eax, dword [YDIM]
    dec eax
    push eax
    mov eax, dword [XDIM]
    dec eax
    push eax
    push 0
    push 0
    push 0x8a
    mov ecx, dword [esp + 0x68]
    xor eax, eax
    push 0
    mov ebx, 0x10000
    mov al, byte [esp + 0x1a]
    push ecx
    add eax, 0xb92
    mov edx, esi
    push eax
    xor ecx, ecx
    mov eax, edi
    call LINK_ADDRESS_3
    add esp, 0x68
    pop ebp
    pop edi
    pop esi
    ret 8
loc_05fa:
    cmp ecx, 9
    jle short loc_0663
    push edx
    push ebx
    push 0
    push 0
    push 0x8a
    xor edx, edx
    push 0
    movzx edi, byte [esp + 0x94]
    mov dl, byte [esp + 0x18]
    push edi
    add edx, 0xb92
    xor ecx, ecx
    push edx
    mov ebx, 0x10000
    mov edx, esi
    call LINK_ADDRESS_3
    mov eax, dword [YDIM]
    dec eax
    push eax
    mov eax, dword [XDIM]
    dec eax
    push eax
    push 0
    push 0
    push 0x8a
    xor eax, eax
    push 0
    mov ebx, 0x10000
    mov al, byte [esp + 0x19]
    push edi
    add eax, 0xb92
    mov edx, esi
    push eax
    xor ecx, ecx
    mov eax, ebp
    jmp short loc_0691
loc_0663:
    push edx
    push ebx
    push 0
    push 0
    push 0x8a
    xor eax, eax
    push 0
    mov al, byte [esp + 0x94]
    push eax
    xor eax, eax
    mov al, byte [esp + 0x1c]
    xor ecx, ecx
    add eax, 0xb92
    mov edx, esi
    push eax
    mov ebx, 0x10000
    mov eax, edi
loc_0691:
    call LINK_ADDRESS_3
    add esp, 0x68
    pop ebp
    pop edi
    pop esi
    ret 8
    nop
