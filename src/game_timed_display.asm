; Timed game status display.
bits 32
org START_ADDRESS

    push ebx
    push ecx
    push edx
    push esi
    sub esp, 0xc
    mov esi, dword [TOTALCLOCK]
    mov eax, dword [LINK_ADDRESS_2]
    lea eax, [eax*4]
    mov edx, dword [eax + LINK_ADDRESS_3]
    cmp esi, edx
    je short loc_0073
    mov ebx, esi
    mov eax, 0x780
    sub ebx, edx
    mov edx, eax
    sar edx, 0x1f
    idiv ebx
    push eax
    push LINK_ADDRESS_4
    lea eax, [esp + 8]
    push eax
    call SPRINTF
    add esp, 0xc
    mov ecx, 0xffffffeb
    push 1
    lea eax, [esp + 4]
    mov ebx, 0x1f
    push eax
    mov edx, dword [WINDOWY1]
    mov eax, dword [WINDOWX1]
    call LINK_ADDRESS_8
    mov eax, dword [LINK_ADDRESS_2]
    mov dword [eax*4 + LINK_ADDRESS_3], esi
loc_0073:
    mov eax, dword [LINK_ADDRESS_2]
    inc eax
    and eax, 0xf
    mov dword [LINK_ADDRESS_2], eax
    add esp, 0xc
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
    mov ebx, dword [LINK_ADDRESS_9]
    xor edx, edx
    cmp ebx, 1
    je short loc_00c8
    mov ecx, dword [LINK_ADDRESS_10]
    cmp ecx, 1
    jle short loc_00ba
    cmp ecx, 5
    jge short loc_00ba
    mov edx, 8
    jmp short loc_00c8
loc_00ba:
    cmp dword [LINK_ADDRESS_10], 4
    jle short loc_00c8
    mov edx, 0x10
loc_00c8:
    cwde
    mov edi, eax
    shl edi, 7
    sub edi, eax
    lea edi, [edi*4]
    sub edi, eax
    add edi, edi
    mov ebp, dword [edi + LINK_ADDRESS_11]
    push ebp
    push LINK_ADDRESS_12
    push LINK_ADDRESS_13
    call SPRINTF
    add esp, 0xc
    mov ecx, 0xffffffff
    mov ebx, 0x1f
    push 1
    movsx esi, dx
    push LINK_ADDRESS_13
    mov edx, esi
    mov eax, 0xfa
    call LINK_ADDRESS_8
    mov eax, dword [edi + LINK_ADDRESS_14]
    push eax
    push LINK_ADDRESS_15
    push LINK_ADDRESS_13
    call SPRINTF
    add esp, 0xc
    push 1
    mov ecx, 0xffffffff
    mov ebx, 0x1f
    push LINK_ADDRESS_13
    lea edx, [esi + 7]
    mov eax, 0xfa
    call LINK_ADDRESS_8
    mov edx, dword [edi + LINK_ADDRESS_16]
    push edx
    push LINK_ADDRESS_17
    push LINK_ADDRESS_13
    call SPRINTF
    add esp, 0xc
    push 1
    mov ecx, 0xffffffff
    mov ebx, 0x1f
    push LINK_ADDRESS_13
    lea edx, [esi + 0xe]
    mov eax, 0xfa
    call LINK_ADDRESS_8
    movsx eax, word [edi + LINK_ADDRESS_18]
    push eax
    push LINK_ADDRESS_19
    push LINK_ADDRESS_13
    call SPRINTF
    add esp, 0xc
    push 1
    mov ecx, 0xffffffff
    mov ebx, 0x1f
    push LINK_ADDRESS_13
    mov eax, 0xfa
    lea edx, [esi + 0x15]
    call LINK_ADDRESS_8
    mov ebx, dword [edi + LINK_ADDRESS_20]
    push ebx
    push LINK_ADDRESS_21
    push LINK_ADDRESS_13
    call SPRINTF
    add esp, 0xc
    push 1
    mov ecx, 0xffffffff
    lea edx, [esi + 0x1c]
    push LINK_ADDRESS_13
    mov ebx, 0x1f
    mov eax, 0xfa
    call LINK_ADDRESS_8
    xor eax, eax
    mov al, byte [edi + LINK_ADDRESS_22]
    push eax
    push LINK_ADDRESS_23
    push LINK_ADDRESS_13
    call SPRINTF
    add esp, 0xc
    push 1
    mov ecx, 0xffffffff
    mov ebx, 0x1f
    push LINK_ADDRESS_13
    lea edx, [esi + 0x23]
    mov eax, 0xfa
    call LINK_ADDRESS_8
    movsx eax, word [edi + LINK_ADDRESS_24]
    push eax
    push LINK_ADDRESS_25
    push LINK_ADDRESS_13
    call SPRINTF
    add esp, 0xc
    push 1
    mov ecx, 0xffffffff
    mov ebx, 0x1f
    push LINK_ADDRESS_13
    lea edx, [esi + 0x2b]
    mov eax, 0xfa
    call LINK_ADDRESS_8
    movsx eax, word [edi + LINK_ADDRESS_26]
    push eax
    push LINK_ADDRESS_27
    push LINK_ADDRESS_13
    call SPRINTF
    add esp, 0xc
    push 1
    mov ecx, 0xffffffff
    mov ebx, 0x1f
    push LINK_ADDRESS_13
    lea edx, [esi + 0x32]
    mov eax, 0xfa
    call LINK_ADDRESS_8
    movsx edx, word [edi + LINK_ADDRESS_28]
    lea eax, [edx*4]
    add eax, edx
    movsx eax, word [eax*8 + LINK_ADDRESS_29]
    push eax
    push LINK_ADDRESS_30
    push LINK_ADDRESS_13
    call SPRINTF
    add esp, 0xc
    push 1
    mov ecx, 0xffffffff
    mov ebx, 0x1f
    push LINK_ADDRESS_13
    lea edx, [esi + 0x39]
    mov eax, 0xfa
    call LINK_ADDRESS_8
    mov ecx, dword [RANDOMSEED]
    push ecx
    push LINK_ADDRESS_32
    push LINK_ADDRESS_13
    call SPRINTF
    add esp, 0xc
    push 1
    mov ebx, 0x1f
    lea edx, [esi + 0x40]
    push LINK_ADDRESS_13
    mov ecx, 0xffffffff
    mov eax, 0xfa
    call LINK_ADDRESS_8
    movsx eax, word [edi + LINK_ADDRESS_33]
    push eax
    push LINK_ADDRESS_34
    push LINK_ADDRESS_13
    call SPRINTF
    add esp, 0xc
    push 1
    mov ecx, 0xffffffff
    mov ebx, 0x1f
    push LINK_ADDRESS_13
    lea edx, [esi + 0x47]
    mov eax, 0xfa
    call LINK_ADDRESS_8
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    db 0x8d, 0x80, 0x00, 0x00, 0x00, 0x00    ; lea eax, [eax]
    nop
