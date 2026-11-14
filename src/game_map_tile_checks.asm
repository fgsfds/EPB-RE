; Classify map tiles by their sprite picture numbers.
bits 32
org START_ADDRESS

    mov ax, word [eax + 0xe]
    cmp ax, 0xa3a
    jb short loc_0026
    jbe short loc_003d
    cmp ax, 0xc3a
    jb short loc_001d
    jbe short loc_003d
    cmp ax, 0xd3a
    je short loc_003d
    xor eax, eax
    ret
loc_001d:
    cmp ax, 0xb3a
    je short loc_003d
    xor eax, eax
    ret
loc_0026:
    cmp ax, 0x33a
    jb short loc_0037
    jbe short loc_003d
    cmp ax, 0x93a
    je short loc_003d
    xor eax, eax
    ret
loc_0037:
    cmp ax, 0x23a
    jne short loc_0043
loc_003d:
    mov eax, 1
    ret
loc_0043:
    xor eax, eax
    ret
    db 0x8d, 0x80, 0x00, 0x00, 0x00, 0x00    ; lea eax, [eax]
    db 0x8d, 0x54, 0x22, 0x00    ; lea edx, [edx]
    mov ax, word [eax + 0xe]
    cmp ax, 0x93c
    jb short loc_007e
    jbe short loc_0095
    cmp ax, 0xb3c
    jb short loc_0075
    jbe short loc_0095
    cmp ax, 0xc3c
    jb short loc_009b
    jbe short loc_0095
    cmp ax, 0xd3c
    je short loc_0095
    xor eax, eax
    ret
loc_0075:
    cmp ax, 0xa3c
    je short loc_0095
    xor eax, eax
    ret
loc_007e:
    cmp ax, 0x23c
    jb short loc_008f
    jbe short loc_0095
    cmp ax, 0x33c
    je short loc_0095
    xor eax, eax
    ret
loc_008f:
    cmp ax, 0x214
    jne short loc_009b
loc_0095:
    mov eax, 1
    ret
loc_009b:
    xor eax, eax
    ret
    db 0x8b, 0xc0    ; mov eax, eax
