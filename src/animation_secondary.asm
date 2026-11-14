; Second linked copy of the animation library routines.
bits 32
org START_ADDRESS

    db 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    cmp dword [LINK_ADDRESS_1], 0
    jne short local_020
    push eax
    push LINK_ADDRESS_2
    call LINK_ADDRESS_3
    add esp, 8
local_020:
    ret
    push ebx
    push ecx
    push edx
    push esi
    mov ebx, eax
    mov eax, LINK_ADDRESS_4
    call LINK_ADDRESS_5
    xor eax, eax
    jmp short local_068
local_035:
    xor ecx, ecx
    mov cx, ax
    imul ecx, ecx, 6
    add edx, ecx
    mov si, word [edx + 0x84]
    cmp bx, si
    jb short local_067
    xor ecx, ecx
    mov cx, word [edx + 0x86]
    mov edx, esi
    and edx, 0xffff
    add ecx, edx
    xor edx, edx
    mov dx, bx
    cmp ecx, edx
    jg short local_074
local_067:
    inc eax
local_068:
    mov edx, dword [LINK_ADDRESS_6]
    cmp ax, word [edx + 0xa]
    jb short local_035
local_074:
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    push ebx
    push ecx
    push esi
    push edi
    push ebp
    mov ebx, eax
    mov ebp, edx
    mov eax, LINK_ADDRESS_7
    call LINK_ADDRESS_5
    mov eax, dword [LINK_ADDRESS_6]
    mov cx, word [eax + 0x684]
    mov edx, dword [eax + 0x2068c]
    cmp bx, cx
    je short local_107
    xor ecx, ecx
    mov cx, bx
    shl ecx, 0x10
    add ecx, 0xb00
    lea edi, [eax + 0x686]
    add edx, ecx
    mov ecx, 6
    mov esi, edx
    mov word [eax + 0x684], bx
    push edi
    mov eax, ecx
    shr ecx, 2
    db 0xf2, 0xa5    ; movsd dword es:[edi], dword [esi]
    db 0x8a, 0xc8    ; mov cl, al
    and cl, 3
    db 0xf2, 0xa4    ; repne movsb byte es:[edi], byte [esi]
    pop edi
    mov eax, dword [LINK_ADDRESS_6]
    xor edi, edi
    xor ecx, ecx
    mov di, word [eax + 0x688]
    mov cx, word [eax + 0x68a]
    add edi, edi
    lea esi, [edx + 8]
    add ecx, edi
    mov edi, ebp
    push edi
    mov eax, ecx
    shr ecx, 2
    db 0xf2, 0xa5    ; movsd dword es:[edi], dword [esi]
    db 0x8a, 0xc8    ; mov cl, al
    and cl, 3
    db 0xf2, 0xa4    ; repne movsb byte es:[edi], byte [esi]
    pop edi
local_107:
    pop ebp
    pop edi
    pop esi
local_10a:
    pop ecx
    pop ebx
    ret
    push ebx
    push ecx
local_10f:
    mov bl, byte [eax]
    inc eax
    test bl, bl
    jg short local_124
    je short local_131
    sub bl, 0x80
    je short local_145
    movsx ebx, bl
    add edx, ebx
    jmp short local_10f
local_124:
    inc edx
    mov bh, byte [eax]
    inc eax
    mov byte [edx - 1], bh
    dec bl
    je short local_10f
    jmp short local_124
local_131:
    inc eax
    inc eax
    xor bh, bh
    mov cl, byte [eax - 1]
    mov bl, byte [eax - 2]
local_13b:
    inc edx
    mov byte [edx - 1], cl
    dec bx
    je short local_10f
    jmp short local_13b
local_145:
    mov bx, word [eax]
    add eax, 2
    test bx, bx
    jle short local_15a
    and ebx, 0xffff
    add edx, ebx
    jmp short local_10f
local_15a:
    je short local_10a
    add bh, 0x80
    cmp bx, 0x4000
    jae short local_173
local_166:
    inc edx
    mov cl, byte [eax]
    inc eax
    mov byte [edx - 1], cl
    dec bx
    je short local_10f
    jmp short local_166
local_173:
    inc eax
    sub ebx, 0x4000
    mov cl, byte [eax - 1]
local_17d:
    inc edx
    mov byte [edx - 1], cl
    dec bx
    je short local_10f
    jmp short local_17d
    db 0x8b, 0xc0    ; mov eax, eax
    push ebx
    push ecx
    push esi
    push edi
    mov esi, eax
    mov ecx, edx
    mov eax, LINK_ADDRESS_8
    call LINK_ADDRESS_5
    mov eax, dword [LINK_ADDRESS_6]
    mov bx, word [eax + 0x686]
    xor edx, edx
    sub esi, ebx
    xor eax, eax
    test si, si
    jbe short local_1c3
local_1b2:
    xor ebx, ebx
    mov bx, ax
    mov di, word [ecx + ebx*2]
    inc eax
    add edx, edi
    cmp ax, si
    jb short local_1b2
local_1c3:
    mov eax, dword [LINK_ADDRESS_6]
    mov ax, word [eax + 0x688]
    and eax, 0xffff
    db 0x8d, 0x1c, 0x45, 0x00, 0x00, 0x00, 0x00    ; lea ebx, [eax*2]
    xor eax, eax
    mov ax, dx
    add eax, ebx
    add eax, ecx
    cmp byte [eax + 1], 0
    je short local_207
    mov dx, word [eax + 2]
    xor dh, dh
    xor ebx, ebx
    and dl, 1
    mov bx, dx
    xor edx, edx
    mov dx, word [eax + 2]
    add edx, ebx
    add edx, 4
    add eax, edx
    jmp short local_20a
local_207:
    add eax, 4
local_20a:
    mov edx, dword [LINK_ADDRESS_6]
    add edx, 0x1068c
    call LINK_ADDRESS_9
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
    nop
    push ebx
    push edx
    mov ebx, eax
    mov eax, LINK_ADDRESS_10
    call LINK_ADDRESS_5
    mov edx, dword [LINK_ADDRESS_6]
    add edx, 0x68c
    and ebx, 0xffff
    mov eax, ebx
    call LINK_ADDRESS_11
    and eax, 0xffff
    call LINK_ADDRESS_12
    mov edx, dword [LINK_ADDRESS_6]
    mov eax, ebx
    add edx, 0x68c
    call LINK_ADDRESS_13
    pop edx
    pop ebx
    ret
    nop
    push ebx
    push ecx
    push edx
    push esi
    push edi
    push ebp
    mov ebp, dword [LINK_ADDRESS_6]
    mov edx, eax
    cmp dword [LINK_ADDRESS_1], 0
    jne short local_297
    mov eax, 0x20994
    mov ecx, 1
    call LINK_ADDRESS_14
    mov ebp, eax
    mov dword [LINK_ADDRESS_1], ecx
local_297:
    mov ecx, 0x80
    mov word [ebp + 0x684], 0xffff
    lea edi, [ebp + 4]
    mov dword [ebp + 0x20990], 0xffffffff
    mov esi, edx
    mov dword [ebp + 0x2068c], edx
    mov dword [LINK_ADDRESS_6], ebp
    push edi
    mov eax, ecx
    shr ecx, 2
    db 0xf2, 0xa5    ; movsd dword es:[edi], dword [esi]
    db 0x8a, 0xc8    ; mov cl, al
    and cl, 3
    db 0xf2, 0xa4    ; repne movsb byte es:[edi], byte [esi]
    pop edi
    add edx, 0x100
    mov ebp, dword [LINK_ADDRESS_6]
    xor eax, eax
    mov esi, ebp
local_2e0:
    xor ebx, ebx
    mov edi, edx
    mov bx, ax
    mov cl, byte [edi]
    inc edx
    mov byte [esi + ebx + 0x20692], cl
    mov ecx, edx
    mov cl, byte [ecx]
    inc edx
    mov byte [esi + ebx + 0x20691], cl
    mov ecx, edx
    db 0x05, 0x03, 0x00, 0x00, 0x00    ; add eax, 3
    mov cl, byte [ecx]
    add edx, 2
    mov byte [esi + ebx + 0x20690], cl
    cmp ax, 0x300
    jb short local_2e0
    mov ecx, 0x600
    lea edi, [ebp + 0x84]
    mov esi, edx
    mov dword [LINK_ADDRESS_6], ebp
    push edi
    mov eax, ecx
    shr ecx, 2
    db 0xf2, 0xa5    ; movsd dword es:[edi], dword [esi]
    db 0x8a, 0xc8    ; mov cl, al
    and cl, 3
    db 0xf2, 0xa4    ; repne movsb byte es:[edi], byte [esi]
    pop edi
    mov ebp, dword [LINK_ADDRESS_6]
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    db 0x8d, 0x40, 0x00    ; lea eax, [eax]
    push ebx
    cmp dword [LINK_ADDRESS_1], 0
    je short local_365
    mov eax, dword [LINK_ADDRESS_6]
    xor ebx, ebx
    call LINK_ADDRESS_15
    mov dword [LINK_ADDRESS_1], ebx
local_365:
    pop ebx
    ret
    db 0x8b, 0xc0    ; mov eax, eax
    mov eax, LINK_ADDRESS_16
    call LINK_ADDRESS_5
    mov eax, dword [LINK_ADDRESS_6]
    mov eax, dword [eax + 0xc]
    ret
    nop
    push ebx
    push ecx
    push edx
    mov ebx, eax
    mov eax, LINK_ADDRESS_17
    call LINK_ADDRESS_5
    mov edx, dword [LINK_ADDRESS_6]
    mov ecx, dword [edx + 0x20990]
    cmp ecx, -1
    je short local_3b8
    cmp ebx, ecx
    jl short local_3b8
    mov edx, ecx
    cmp ecx, ebx
    jge short local_3cd
local_3a7:
    xor eax, eax
    mov ax, dx
    inc edx
    call LINK_ADDRESS_18
    cmp edx, ebx
    jge short local_3cd
    jmp short local_3a7
local_3b8:
    xor edx, edx
    test ebx, ebx
    jle short local_3cd
local_3be:
    xor eax, eax
    mov ax, dx
    inc edx
    call LINK_ADDRESS_18
    cmp edx, ebx
    jl short local_3be
local_3cd:
    mov eax, dword [LINK_ADDRESS_6]
    add eax, 0x1068c
    mov dword [eax + 0x10304], ebx
    pop edx
    pop ecx
    pop ebx
    ret
    mov eax, LINK_ADDRESS_19
    call LINK_ADDRESS_5
    mov eax, dword [LINK_ADDRESS_6]
    add eax, 0x20690
    ret
