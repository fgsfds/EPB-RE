bits 32
org START_ADDRESS

    wait
    fnsave dword [eax]
    wait
    ret
    frstor dword [eax]
    wait
    ret
local_009:
    push ebx
    push edx
    cmp byte [LINK_ADDRESS_1], 0
    je short local_02a
    mov edx, LINK_ADDRESS_2
    mov ebx, LINK_ADDRESS_3
    mov dword [LINK_ADDRESS_4], edx
    mov dword [LINK_ADDRESS_5], ebx
local_02a:
    xor eax, eax
    mov ax, word [LINK_ADDRESS_6]
    call LINK_ADDRESS_7
    pop edx
    pop ebx
    ret
    cmp byte [LINK_ADDRESS_1], 0
    jne short local_009
    ret
    push edx
    mov ah, byte [LINK_ADDRESS_8]
    test ah, ah
    jne short local_08c
    mov byte [LINK_ADDRESS_1], ah
    xor dl, dl
    db 0x2b, 0xc0    ; sub eax, eax
    push eax
    fninit
    fnstcw word [esp]
    pop eax
    db 0x8a, 0xc4    ; mov al, ah
    xor dh, dh
    and eax, 0xff
    cmp eax, 3
    jne short local_077
    call local_009
    mov dl, al
    mov dh, al
local_077:
    cmp byte [LINK_ADDRESS_9], 0
    jne short local_08c
    mov byte [LINK_ADDRESS_8], dl
    mov byte [LINK_ADDRESS_1], dh
local_08c:
    pop edx
    ret
