; Sprite tile trigger checks.
bits 32
org START_ADDRESS

%if GAME_UPDATE
    mov ax, word [eax + 0xe]
    db 0x66, 0x3d, 0x3b, 0x00    ; cmp ax, 0x3b
    jb short loc_001d
    jbe short loc_0031
    db 0x66, 0x3d, 0x3d, 0x00    ; cmp ax, 0x3d
    jb short loc_0037
    jbe short loc_0031
    cmp ax, 0x544
    je short loc_0031
    xor eax, eax
    ret
loc_001d:
    db 0x66, 0x3d, 0x35, 0x00    ; cmp ax, 0x35
    jb short loc_0037
    jbe short loc_0031
    db 0x66, 0x3d, 0x37, 0x00    ; cmp ax, 0x37
    jb short loc_0037
    db 0x66, 0x3d, 0x39, 0x00    ; cmp ax, 0x39
    ja short loc_0037
loc_0031:
    mov eax, 1
    ret
loc_0037:
    xor eax, eax
    ret
    lea eax, [dword eax + 0]
%else
    mov ax, word [eax + 0xe]
    db 0x66, 0x3d, 0x3d, 0x00    ; cmp ax, 0x3d
    jb short loc_0026
    jbe short loc_004e
    cmp ax, 0xea0
    jb short loc_001d
    jbe short loc_0044
    cmp ax, 0xea3
    je short loc_0044
    xor eax, eax
    ret
loc_001d:
    cmp ax, 0x544
    je short loc_004e
    xor eax, eax
    ret
loc_0026:
    db 0x66, 0x3d, 0x37, 0x00    ; cmp ax, 0x37
    jb short loc_003b
    db 0x66, 0x3d, 0x39, 0x00    ; cmp ax, 0x39
    jbe short loc_004e
    db 0x66, 0x3d, 0x3b, 0x00    ; cmp ax, 0x3b
    je short loc_004e
    xor eax, eax
    ret
loc_003b:
    db 0x66, 0x3d, 0x35, 0x00    ; cmp ax, 0x35
    je short loc_004e
    xor eax, eax
    ret
loc_0044:
    mov eax, 0x1b0
    call TRIGGER_HANDLER
loc_004e:
    mov eax, 1
    ret
    lea eax, [dword eax + 0]
    lea edx, [dword edx + 0]
%endif
