; Version-specific setup routines.
bits 32
org START_ADDRESS

%if GAME_UPDATE
    db 0x8d, 0x80, 0x00, 0x00, 0x00, 0x00    ; lea eax, [eax]
    db 0x8b, 0xd2    ; mov edx, edx
    ret
    db 0x8d, 0x80, 0x00, 0x00, 0x00, 0x00    ; lea eax, [eax]
    db 0x8d, 0x92, 0x00, 0x00, 0x00, 0x00    ; lea edx, [edx]
    db 0x8d, 0x40, 0x00    ; lea eax, [eax]
%else
    ret
    db 0x8d, 0x80, 0x00, 0x00, 0x00, 0x00    ; lea eax, [eax]
    nop
    push ebx
    push edx
    cmp byte [eax + 0x3d0], 0
    je short loc_0022
    mov dword [eax + 0x3e5], 0x21938
    jmp near loc_0095
loc_0022:
    movsx ebx, word [eax + 0x29e]
    lea edx, [ebx*4]
    add edx, ebx
    mov dx, word [edx*8 + 0x2385b4]
    cmp dx, 0xc8
    jb short loc_005c
    cmp dx, 0xca
    ja short loc_005c
    mov dword [eax + 0x3e5], 0x21938
    mov byte [0x22747], 1
    pop edx
    pop ebx
    ret
loc_005c:
    movsx ebx, word [eax + 0x29e]
    lea edx, [ebx*4]
    add edx, ebx
    cmp word [edx*8 + 0x2385c6], 2
    jne short loc_008b
    mov dword [eax + 0x3e5], 0x20738
    mov byte [0x22747], 1
    pop edx
    pop ebx
    ret
loc_008b:
    mov dword [eax + 0x3e5], 0x1c08a4
loc_0095:
    mov byte [0x22747], 1
    pop edx
    pop ebx
    ret
    db 0x8d, 0x80, 0x00, 0x00, 0x00, 0x00    ; lea eax, [eax]
    db 0x8d, 0x52, 0x00    ; lea edx, [edx]
    push ebx
    push ecx
    push edx
    push esi
    mov ebx, eax
    movsx eax, word [eax + 0x340]
    imul eax, eax, 0x2c
    movsx ecx, word [ebx + 0x350]
    sar ecx, 8
    movsx edx, word [eax + 0x1c0bce]
    sub edx, ecx
    mov word [eax + 0x1c0bce], dx
    movsx eax, word [ebx + 0x340]
    imul eax, eax, 0x2c
    movsx ecx, word [ebx + 0x2a2]
    movsx eax, word [eax + 0x1c0bce]
    sub eax, ecx
    mov ecx, eax
    test eax, eax
    jge short loc_0167
    mov dx, word [ebx + 0x38c]
    mov word [ebx + 0x350], 0
    test dx, dx
    jle short loc_014f
    call 0x7079f
    mov edx, eax
    mov esi, 0x1e
    sar edx, 0x1f
    idiv esi
    add edx, 0x14
    imul edx, ecx
    mov esi, 0x64
    mov eax, edx
    sar edx, 0x1f
    idiv esi
    mov si, word [ebx + 0x38c]
    add esi, eax
    sub ecx, eax
    mov word [ebx + 0x38c], si
    test si, si
    jge short loc_014f
    movsx eax, si
    mov word [ebx + 0x38c], 0
    add ecx, eax
loc_014f:
    add cx, word [ebx + 0x2a2]
    movsx eax, word [ebx + 0x340]
    imul eax, eax, 0x2c
    mov word [eax + 0x1c0bce], cx
loc_0167:
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    db 0x8d, 0x80, 0x00, 0x00, 0x00, 0x00    ; lea eax, [eax]
    db 0x8d, 0x92, 0x00, 0x00, 0x00, 0x00    ; lea edx, [edx]
    push ebx
    push ecx
    push edx
    movsx edx, word [eax + 0x340]
    imul edx, edx, 0x2c
    mov byte [eax + 0x3f0], 0x30
    mov byte [eax + 0x3f1], 0x30
    mov byte [eax + 0x3f2], 0x30
    mov dword [eax + 0x274], 0x30
    xor ebx, ebx
    mov word [edx + 0x1c0bce], bx
    movsx edx, word [eax + 0x340]
    imul edx, edx, 0x2c
    or byte [edx + 0x1c0bb1], 0x80
    cmp byte [0xe8d7c], 0
    jne short loc_01ec
    movsx eax, word [eax + 0x340]
    imul eax, eax, 0x2c
    mov ebx, 8
    mov edx, 0x8ee
    movsx ecx, word [0x261216]
    add eax, 0x1c0ba4
    call 0x28990
loc_01ec:
    pop edx
    pop ecx
    pop ebx
    ret
    db 0x8d, 0x80, 0x00, 0x00, 0x00, 0x00    ; lea eax, [eax]
    db 0x8b, 0xd2    ; mov edx, edx
%endif
