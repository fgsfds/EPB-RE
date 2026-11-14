bits 32
org START_ADDRESS

    ret
    push ebx
    push ecx
    push edx
    push esi
    push edi
    push ebp
    sub esp, 0xc
    mov ebx, esp
    mov eax, dword [LINK_ADDRESS_1]
    xor edx, edx
    call local_0c2
    mov ecx, dword [esp]
    inc eax
    mov edx, dword [LINK_ADDRESS_1]
    mov dword [esp + 8], eax
    sub ecx, edx
    shl eax, 2
    inc ecx
    mov dword [esp + 4], eax
    add eax, 4
    add eax, ecx
    call LINK_ADDRESS_2
    mov ebp, eax
    test eax, eax
    je short local_09b
    mov ebx, esp
    mov esi, dword [LINK_ADDRESS_1]
    add eax, ecx
    mov edi, ebp
    mov dword [LINK_ADDRESS_3], eax
    push es
    mov eax, ds
    mov es, eax
    push edi
    mov eax, ecx
    shr ecx, 2
    db 0xf2, 0xa5    ; movsd dword es:[edi], dword [esi]
    db 0x8a, 0xc8    ; mov cl, al
    and cl, 3
    db 0xf2, 0xa4    ; repne movsb byte es:[edi], byte [esi]
    pop edi
    pop es
    mov ecx, dword [LINK_ADDRESS_3]
    mov eax, dword [LINK_ADDRESS_4]
    lea edx, [ecx + 4]
    mov dword [ecx], eax
    mov eax, ebp
    mov esi, dword [esp + 4]
    call local_0c2
    mov ecx, dword [LINK_ADDRESS_3]
    mov eax, dword [esp + 8]
    add ecx, esi
    mov dword [LINK_ADDRESS_5], eax
    mov dword [ecx], 0
    jmp short local_0a5
local_09b:
    mov dword [LINK_ADDRESS_3], eax
    mov dword [LINK_ADDRESS_5], eax
local_0a5:
    mov eax, dword [esp + 8]
    mov dword [LINK_ADDRESS_6], eax
    mov eax, dword [LINK_ADDRESS_3]
    mov dword [LINK_ADDRESS_7], eax
    add esp, 0xc
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
local_0c2:
    push ecx
    push esi
    push edi
    push ebp
    sub esp, 8
    mov esi, dword [LINK_ADDRESS_8]
    mov edi, edx
    mov ebp, ebx
    xor edx, edx
    mov dword [esp + 4], edx
local_0d9:
    xor ebx, ebx
    mov bl, byte [eax]
    cmp ebx, 0x20
    je short local_0e7
    cmp ebx, 9
    jne short local_0ea
local_0e7:
    inc eax
    jmp short local_0d9
local_0ea:
    test bl, bl
    je near local_1bc
    xor dl, dl
    cmp ebx, 0x22
    jne short local_0fc
    mov dl, 1
    inc eax
local_0fc:
    mov dword [esp], eax
    mov ebx, eax
local_101:
    xor ecx, ecx
    mov cl, byte [eax]
    cmp ecx, 0x22
    jne short local_12a
    cmp dl, 1
    je near local_189
    test esi, esi
    jne short local_12a
    test dl, dl
    jne short local_120
    mov dl, 2
local_11d:
    inc eax
    jmp short local_101
local_120:
    cmp dl, 2
    jne short local_12a
    inc eax
    xor dl, dl
    jmp short local_101
local_12a:
    xor ecx, ecx
    mov cl, byte [eax]
    cmp ecx, 0x20
    je short local_138
    cmp ecx, 9
    jne short local_13c
local_138:
    test dl, dl
    je short local_189
local_13c:
    mov dh, byte [eax]
    test dh, dh
    je short local_189
    xor ecx, ecx
    mov cl, dh
    cmp ecx, 0x5c
    jne short local_17a
    test esi, esi
    jne short local_15b
    xor ecx, ecx
    mov cl, byte [eax + 1]
    cmp ecx, 0x22
local_157:
    jne short local_17a
    jmp short local_179
local_15b:
    cmp dl, 1
    jne short local_16f
    xor ecx, ecx
    mov cl, byte [eax + 1]
    cmp ecx, 0x22
    je short local_179
    cmp ecx, 0x5c
    jmp short local_157
local_16f:
    xor ecx, ecx
    mov cl, byte [eax + 1]
    cmp ecx, 0x22
    jne short local_17a
local_179:
    inc eax
local_17a:
    test edi, edi
    je short local_11d
    mov cl, byte [eax]
    inc eax
    mov byte [ebx], cl
    inc ebx
    jmp near local_101
local_189:
    test edi, edi
    je short local_1af
    mov ecx, dword [esp + 4]
    mov edx, dword [esp]
    mov dword [edi + ecx*4], edx
    inc ecx
    mov dword [esp + 4], ecx
    mov cl, byte [eax]
    test cl, cl
    jne short local_1a6
    mov byte [ebx], cl
    jmp short local_1bc
local_1a6:
    inc eax
    mov byte [ebx], 0
    jmp near local_0d9
local_1af:
    inc dword [esp + 4]
    cmp byte [eax], 0
    jne near local_0e7
local_1bc:
    mov dword [ebp], eax
    mov eax, dword [esp + 4]
    mov dword [LINK_ADDRESS_8], esi
    add esp, 8
    pop ebp
    pop edi
    pop esi
    pop ecx
    ret
    db 0x00
