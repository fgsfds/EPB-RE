; HUD tile drawing helpers.
bits 32
org START_ADDRESS

    push esi
    push edi
    push ebp
    test byte [esp + 0x10], 4
    je short loc_0011
    mov esi, 0x400
    jmp short loc_0013
loc_0011:
    xor esi, esi
loc_0013:
    mov edi, dword [WINDOWY2]
    mov ch, byte [esp + 0x10]
    push edi
    mov ebp, dword [WINDOWX2]
    mov edi, dword [WINDOWY1]
    push ebp
    shl edx, 0x10
    push edi
    mov ebp, dword [WINDOWX1]
    or ch, 2
    push ebp
    movzx edi, ch
    push edi
    movzx edi, byte [esp + 0x28]
    movsx ecx, cl
    push edi
    shl eax, 0x10
    push ecx
    movsx ecx, bx
    mov ebx, 0x10000
    push ecx
    movsx ecx, si
    call LINK_ADDRESS_5
    pop ebp
    pop edi
    pop esi
    ret 8
    db 0x8d, 0x80, 0x00, 0x00, 0x00, 0x00    ; lea eax, [eax]
    db 0x8d, 0x92, 0x00, 0x00, 0x00, 0x00    ; lea edx, [edx]
    db 0x8d, 0x40, 0x00    ; lea eax, [eax]
    push esi
    push edi
    push ebp
    mov ch, byte [esp + 0x10]
    mov ebp, eax
    mov edi, edx
    test ch, 4
    je short loc_0087
    mov edx, 0x400
    jmp short loc_0089
loc_0087:
    xor edx, edx
loc_0089:
    movsx esi, word [LINK_ADDRESS_6]
    mov eax, esi
    shl eax, 7
    sub eax, esi
    lea eax, [eax*4]
    sub eax, esi
    movsx eax, word [nosplit eax*2 + LINK_ADDRESS_7]
    mov esi, eax
    lea eax, [eax*4]
    add eax, esi
    shl edi, 0x10
    mov al, byte [eax*8 + LINK_ADDRESS_8]
    mov esi, ebp
    mov ah, ch
    shl esi, 0x10
    or ah, 2
    cmp word [esp + 0x14], 0
    jl short loc_010c
    mov ebp, dword [WINDOWY2]
    push ebp
    mov ebp, dword [WINDOWX2]
    push ebp
    mov ebp, dword [WINDOWY1]
    push ebp
    mov ebp, dword [WINDOWX1]
    push ebp
    movzx ebp, ah
    push ebp
    and eax, 0xff
    push eax
    movsx eax, cl
    push eax
    movsx ecx, dx
    movsx eax, bx
    mov edx, edi
    movsx ebx, word [esp + 0x30]
    push eax
    shl ebx, 0x10
    jmp short loc_0159
loc_010c:
    mov ebp, dword [WINDOWY2]
    push ebp
    mov ebp, dword [WINDOWX2]
    push ebp
    mov ebp, dword [WINDOWY1]
    push ebp
    mov ebp, dword [WINDOWX1]
    push ebp
    movzx ebp, ah
    push ebp
    and eax, 0xff
    push eax
    movsx eax, cl
    push eax
    movsx eax, bx
    push eax
    movsx eax, word [esp + 0x34]
    call LINK_ADDRESS_9
    mov ebx, eax
    mov eax, 0x10000
    movsx ecx, dx
    mov edx, eax
    sar edx, 0x1f
    idiv ebx
    mov ebx, eax
    mov edx, edi
loc_0159:
    mov eax, esi
    call LINK_ADDRESS_5
    pop ebp
    pop edi
    pop esi
    ret 8
    db 0x8d, 0x80, 0x00, 0x00, 0x00, 0x00    ; lea eax, [eax]
    db 0x8d, 0x54, 0x22, 0x00    ; lea edx, [edx]
    push esi
    push edi
    push ebp
    sub esp, 0x64
    mov dword [esp + 0x50], edx
    mov dl, cl
    mov ebp, eax
    mov dh, byte [esp + 0x74]
    mov ecx, 0x14
    xor eax, eax
    mov edi, esp
    mov al, bl
    mov esi, 0x10
    push eax
    db 0xf3, 0xa5    ; rep movsd dword es:[edi], dword [esi]
    push LINK_ADDRESS_10
    lea eax, [esp + 8]
    mov esi, ebp
    push eax
    shl esi, 0x10
    call SPRINTF
    mov ecx, dword [YDIM]
    mov eax, ebp
    add esp, 0xc
    add eax, 4
    dec ecx
    mov dword [esp + 0x60], esi
    mov dword [esp + 0x54], eax
    mov esi, dword [esp + 0x50]
    mov edi, dword [esp + 0x54]
    mov eax, dword [XDIM]
    shl esi, 0x10
    dec eax
    shl edi, 0x10
    cmp bl, 0x63
    jbe near loc_0299
    push ecx
    push eax
    xor eax, eax
    push 0
    mov al, dh
    push 0
    mov dword [esp + 0x68], eax
    push eax
    xor eax, eax
    mov al, dl
    push 0
    mov dword [esp + 0x74], eax
    push eax
    xor eax, eax
    mov al, byte [esp + 0x1c]
    mov ebx, 0x10000
    add eax, 0xb92
    xor ecx, ecx
    push eax
    lea eax, [ebp - 4]
    mov edx, esi
    shl eax, 0x10
    call LINK_ADDRESS_5
    mov eax, dword [YDIM]
    dec eax
    push eax
    mov eax, dword [XDIM]
    dec eax
    push eax
    push 0
    push 0
    mov ebx, dword [esp + 0x68]
    push ebx
    mov ecx, dword [esp + 0x70]
    xor eax, eax
    push 0
    mov edx, esi
    mov al, byte [esp + 0x19]
    push ecx
    add eax, 0xb92
    mov ebx, 0x10000
    push eax
    xor ecx, ecx
    mov eax, dword [esp + 0x80]
    call LINK_ADDRESS_5
    mov eax, dword [YDIM]
    dec eax
    push eax
    mov eax, dword [XDIM]
    dec eax
    push eax
    push 0
    push 0
    mov ebp, dword [esp + 0x68]
    push ebp
    push 0
    mov eax, dword [esp + 0x74]
    push eax
    xor eax, eax
    mov al, byte [esp + 0x1e]
    mov ebx, 0x10000
    add eax, 0xb92
    mov edx, esi
    push eax
    xor ecx, ecx
    mov eax, edi
    call LINK_ADDRESS_5
    add esp, 0x64
    pop ebp
    pop edi
    pop esi
    ret 4
loc_0299:
    cmp bl, 9
    jbe short loc_0313
    push ecx
    push eax
    push 0
    xor eax, eax
    push 0
    mov al, dh
    push eax
    mov ebx, 0x10000
    mov dword [esp + 0x70], eax
    push 0
    xor eax, eax
    movzx ebp, dl
    mov al, byte [esp + 0x18]
    push ebp
    add eax, 0xb92
    xor ecx, ecx
    push eax
    mov edx, esi
    mov eax, dword [esp + 0x80]
    call LINK_ADDRESS_5
    mov eax, dword [YDIM]
    dec eax
    push eax
    mov eax, dword [XDIM]
    dec eax
    push eax
    push 0
    push 0
    mov ecx, dword [esp + 0x6c]
    push ecx
    xor eax, eax
    push 0
    mov ebx, 0x10000
    mov al, byte [esp + 0x19]
    push ebp
    add eax, 0xb92
    mov edx, esi
    push eax
    xor ecx, ecx
    mov eax, edi
    call LINK_ADDRESS_5
    add esp, 0x64
    pop ebp
    pop edi
    pop esi
    ret 4
loc_0313:
    push ecx
    push eax
    push 0
    xor eax, eax
    push 0
    mov al, dh
    push eax
    xor eax, eax
    push 0
    mov al, dl
    push eax
    xor eax, eax
    mov al, byte [esp + 0x1c]
    mov ebx, 0x10000
    add eax, 0xb92
    xor ecx, ecx
    push eax
    mov edx, esi
    mov eax, edi
    call LINK_ADDRESS_5
    add esp, 0x64
    pop ebp
    pop edi
    pop esi
    ret 4
    db 0x8d, 0x80, 0x00, 0x00, 0x00, 0x00    ; lea eax, [eax]
