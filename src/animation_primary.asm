; Animation library routines. Watcom's original alignment instructions
; require explicit encodings when NASM selects a shorter alternative.
bits 32
org START_ADDRESS

    db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
local_009:
    cmp dword [LINK_ADDRESS_1], 0
    jne short local_020
    push eax
    push LINK_ADDRESS_2
    call LINK_ADDRESS_3
    add esp, 8
local_020:
    ret
    db 0x8d, 0x80, 0x00, 0x00, 0x00, 0x00    ; lea eax, [eax]
    db 0x8b, 0xd2    ; mov edx, edx
local_029:
    push ebx
    push ecx
    push edx
    push esi
    push edi
    mov esi, eax
    mov eax, LINK_ADDRESS_4
    call local_009
    xor edx, edx
    jmp short local_078
local_03e:
    xor ecx, ecx
    mov cx, dx
    lea eax, [ecx*4]
    sub eax, ecx
    add eax, eax
    add eax, ebx
    mov di, word [eax + 0x82]
    cmp si, di
    jb short local_077
    xor ebx, ebx
    mov bx, word [eax + 0x84]
    mov eax, edi
    and eax, 0xffff
    add eax, ebx
    xor ebx, ebx
    mov bx, si
    cmp eax, ebx
    jg short local_084
local_077:
    inc edx
local_078:
    mov ebx, dword [LINK_ADDRESS_5]
    cmp dx, word [ebx + 8]
    jb short local_03e
local_084:
    mov eax, edx
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    db 0x8d, 0x80, 0x00, 0x00, 0x00, 0x00    ; lea eax, [eax]
    db 0x8d, 0x92, 0x00, 0x00, 0x00, 0x00    ; lea edx, [edx]
    nop
local_099:
    push ebx
    push ecx
    push esi
    mov ebx, eax
    mov esi, edx
    mov eax, LINK_ADDRESS_6
    call local_009
    mov eax, dword [LINK_ADDRESS_5]
    mov dx, word [eax + 0x682]
    mov ecx, dword [eax + 0x2068a]
    cmp bx, dx
    je short local_114
    mov word [eax + 0x682], bx
    xor eax, eax
    mov ax, bx
    shl eax, 0x10
    add eax, 0xb00
    mov ebx, 6
    add ecx, eax
    mov eax, dword [LINK_ADDRESS_5]
    mov edx, ecx
    add eax, 0x684
    call LINK_ADDRESS_7
    add ecx, 8
    mov eax, dword [LINK_ADDRESS_5]
    xor edx, edx
    xor ebx, ebx
    mov dx, word [eax + 0x686]
    mov bx, word [eax + 0x688]
    add edx, edx
    mov eax, esi
    add ebx, edx
    mov edx, ecx
    call LINK_ADDRESS_7
local_114:
    pop esi
local_115:
    pop ecx
    pop ebx
    ret
    nop
local_119:
    push ebx
    push ecx
local_11b:
    mov bl, byte [eax]
    inc eax
    test bl, bl
    jg short local_130
    je short local_13d
    sub bl, 0x80
    je short local_151
    movsx ebx, bl
    add edx, ebx
    jmp short local_11b
local_130:
    inc edx
    mov bh, byte [eax]
    inc eax
    mov byte [edx - 1], bh
    dec bl
    jne short local_130
    jmp short local_11b
local_13d:
    inc eax
    inc eax
    xor bh, bh
    mov cl, byte [eax - 1]
    mov bl, byte [eax - 2]
local_147:
    inc edx
    mov byte [edx - 1], cl
    dec bx
    jne short local_147
    jmp short local_11b
local_151:
    mov bx, word [eax]
    add eax, 2
    test bx, bx
    jle short local_166
    and ebx, 0xffff
    add edx, ebx
    jmp short local_11b
local_166:
    je short local_115
    add bh, 0x80
    cmp bx, 0x4000
    jae short local_17f
local_172:
    inc edx
    mov cl, byte [eax]
    inc eax
    mov byte [edx - 1], cl
    dec bx
    jne short local_172
    jmp short local_11b
local_17f:
    inc eax
    sub ebx, 0x4000
    mov cl, byte [eax - 1]
local_189:
    inc edx
    mov byte [edx - 1], cl
    dec bx
    jne short local_189
    jmp short local_11b
    db 0x8d, 0x80, 0x00, 0x00, 0x00, 0x00    ; lea eax, [eax]
local_199:
    push ebx
    push ecx
    push esi
    push edi
    mov esi, eax
    mov ecx, edx
    mov eax, LINK_ADDRESS_8
    call local_009
    mov ebx, dword [LINK_ADDRESS_5]
    xor edx, edx
    mov di, word [ebx + 0x684]
    xor eax, eax
    sub esi, edi
    jmp short local_1cc
local_1c0:
    xor ebx, ebx
    mov bx, ax
    mov di, word [ecx + ebx*2]
    inc eax
    add edx, edi
local_1cc:
    cmp ax, si
    jb short local_1c0
    mov ebx, dword [LINK_ADDRESS_5]
    mov bx, word [ebx + 0x686]
    and ebx, 0xffff
    add ebx, ebx
    and edx, 0xffff
    add ebx, edx
    add ebx, ecx
    cmp byte [ebx + 1], 0
    je short local_212
    mov ax, word [ebx + 2]
    xor edx, edx
    xor ah, ah
    xor ecx, ecx
    and al, 1
    mov cx, word [ebx + 2]
    mov dx, ax
    add edx, ecx
    add edx, 4
    add ebx, edx
    jmp short local_215
local_212:
    add ebx, 4
local_215:
    mov edx, dword [LINK_ADDRESS_5]
    mov eax, ebx
    add edx, 0x1068a
    call local_119
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
    db 0x8d, 0x80, 0x00, 0x00, 0x00, 0x00    ; lea eax, [eax]
    db 0x8d, 0x92, 0x00, 0x00, 0x00, 0x00    ; lea edx, [edx]
local_239:
    push ebx
    push edx
    mov ebx, eax
    mov eax, LINK_ADDRESS_9
    call local_009
    mov edx, dword [LINK_ADDRESS_5]
    add edx, 0x68a
    and ebx, 0xffff
    mov eax, ebx
    call local_029
    and eax, 0xffff
    call local_099
    mov edx, dword [LINK_ADDRESS_5]
    mov eax, ebx
    add edx, 0x68a
    call local_199
    pop edx
    pop ebx
    ret
    db 0x8d, 0x80, 0x00, 0x00, 0x00, 0x00    ; lea eax, [eax]
    db 0x8d, 0x52, 0x00    ; lea edx, [edx]
    push ebx
    push ecx
    push edx
    push esi
    push edi
    mov ecx, eax
    cmp dword [LINK_ADDRESS_1], 0
    jne short local_2a3
    mov dword [LINK_ADDRESS_1], 1
local_2a3:
    mov eax, dword [LINK_ADDRESS_5]
    mov dword [eax + 0x2068a], ecx
    mov eax, dword [LINK_ADDRESS_5]
    mov word [eax + 0x682], 0xffff
    mov eax, dword [LINK_ADDRESS_5]
    mov dword [eax + 0x2098e], 0xffffffff
    mov ebx, 0x80
    mov eax, dword [LINK_ADDRESS_5]
    mov edx, ecx
    add eax, 2
    add ecx, 0x100
    call LINK_ADDRESS_7
    xor eax, eax
    jmp short local_330
local_2e9:
    xor edx, edx
    mov ebx, dword [LINK_ADDRESS_5]
    mov dx, ax
    mov esi, ecx
    lea edi, [ebx + edx]
    mov bl, byte [esi]
    mov byte [edi + 0x20690], bl
    inc ecx
    mov ebx, dword [LINK_ADDRESS_5]
    mov edi, ecx
    lea esi, [ebx + edx]
    mov bl, byte [edi]
    mov byte [esi + 0x2068f], bl
    inc ecx
    mov ebx, dword [LINK_ADDRESS_5]
    mov esi, ecx
    db 0x05, 0x03, 0x00, 0x00, 0x00    ; add eax, 3
    add edx, ebx
    mov bl, byte [esi]
    add ecx, 2
    mov byte [edx + 0x2068e], bl
local_330:
    cmp ax, 0x300
    jb short local_2e9
    mov ebx, 0x600
    mov eax, dword [LINK_ADDRESS_5]
    mov edx, ecx
    add eax, 0x82
    call LINK_ADDRESS_7
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    db 0x8d, 0x80, 0x00, 0x00, 0x00, 0x00    ; lea eax, [eax]
    nop
    push ebx
    cmp dword [LINK_ADDRESS_1], 0
    je short local_36b
    xor ebx, ebx
    mov dword [LINK_ADDRESS_1], ebx
local_36b:
    pop ebx
    ret
    db 0x8d, 0x80, 0x00, 0x00, 0x00, 0x00    ; lea eax, [eax]
    db 0x8d, 0x92, 0x00, 0x00, 0x00, 0x00    ; lea edx, [edx]
    mov eax, LINK_ADDRESS_10
    call local_009
    mov eax, dword [LINK_ADDRESS_5]
    mov eax, dword [eax + 0xa]
    ret
    db 0x8d, 0x80, 0x00, 0x00, 0x00, 0x00    ; lea eax, [eax]
    db 0x8d, 0x92, 0x00, 0x00, 0x00, 0x00    ; lea edx, [edx]
    nop
    push ebx
    push ecx
    push edx
    mov ebx, eax
    mov eax, LINK_ADDRESS_11
    call local_009
    mov edx, dword [LINK_ADDRESS_5]
    mov ecx, dword [edx + 0x2098e]
    cmp ecx, -1
    je short local_3d2
    cmp ebx, ecx
    jl short local_3d2
    mov edx, ecx
    jmp short local_3cc
local_3c1:
    xor eax, eax
    mov ax, dx
    call local_239
    inc edx
local_3cc:
    cmp edx, ebx
    jl short local_3c1
    jmp short local_3e5
local_3d2:
    xor edx, edx
    jmp short local_3e1
local_3d6:
    xor eax, eax
    mov ax, dx
    call local_239
    inc edx
local_3e1:
    cmp edx, ebx
    jl short local_3d6
local_3e5:
    mov eax, dword [LINK_ADDRESS_5]
    mov dword [eax + 0x2098e], ebx
    mov eax, dword [LINK_ADDRESS_5]
    add eax, 0x1068a
    pop edx
    pop ecx
    pop ebx
    ret
    db 0x8d, 0x80, 0x00, 0x00, 0x00, 0x00    ; lea eax, [eax]
    db 0x8d, 0x52, 0x00    ; lea edx, [edx]
    db 0x8b, 0xdb    ; mov ebx, ebx
    mov eax, LINK_ADDRESS_12
    call local_009
    mov eax, dword [LINK_ADDRESS_5]
    add eax, 0x2068e
    ret
    add byte [eax], al
    db 0x00
