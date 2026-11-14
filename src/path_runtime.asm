; Floating-point formatting and trimming of trailing zeroes.
bits 32
org START_ADDRESS

    push ecx
    push esi
    push edi
    push ebp
    sub esp, 8
    mov esi, eax
    mov edi, ebx
    mov eax, edx
    mov ebx, ds
    mov dword [edi + 0xc], 0
    mov ecx, esi
    mov dl, byte [edi + 0x15]
    xor ebp, ebp
    cmp dl, 0x47
    jb short local_03f
    jbe short local_04c
    cmp dl, 0x66
    jb short local_035
    jbe short local_061
    cmp dl, 0x67
    je short local_04c
    jmp near local_0de
local_035:
    cmp dl, 0x65
    je short local_05c
    jmp near local_0de
local_03f:
    cmp dl, 0x45
    jb near local_0de
    jbe short local_05c
    jmp short local_061
local_04c:
    cmp dword [edi + 8], 0
    jne short local_059
    mov dword [edi + 8], 1
local_059:
    sub dl, 2
local_05c:
    mov ebp, 1
local_061:
    mov ecx, dword [eax]
    add ecx, 8
    mov dword [eax], ecx
    mov eax, dword [ecx - 8]
    mov dword [esp], eax
    mov eax, dword [ecx - 4]
    mov dword [esp + 4], eax
    cmp dword [edi + 8], -1
    jne short local_082
    mov dword [edi + 8], 6
local_082:
    mov al, byte [edi + 0x15]
    and al, 0x5f
    and eax, 0xff
    push eax
    xor eax, eax
    mov al, dl
    push eax
    push 3
    push ebp
    mov ebx, dword [edi + 8]
    xor ecx, ecx
    push 0xff
    lea edx, [esp + 0x14]
    mov eax, esi
    call LINK_ADDRESS_1
    xor eax, eax
    mov al, byte [esi]
    cmp eax, 0x2a
    jne short local_0b7
    mov byte [edi + 0x16], 0x2a
local_0b7:
    mov byte [esi + 0xff], 0
local_0be:
    xor eax, eax
    mov al, byte [esi]
    cmp eax, 0x20
    jne short local_0ca
    inc esi
    jmp short local_0be
local_0ca:
    mov edx, edi
    mov eax, esi
    call local_0ea
    mov ebx, ds
    mov ecx, esi
    mov dword [edi + 8], 0xffffffff
local_0de:
    mov edx, ebx
    mov eax, ecx
    add esp, 8
    pop ebp
    pop edi
    pop esi
    pop ecx
    ret
local_0ea:
    push ebx
    mov ebx, edx
    mov dl, byte [edx + 0x14]
    and dl, 1
    and edx, 0xff
    jne short local_147
local_0fb:
    cmp byte [eax], 0
    je short local_111
    xor edx, edx
    mov dl, byte [eax]
    cmp edx, 0x65
    je short local_111
    cmp edx, 0x45
    je short local_111
    inc eax
    jmp short local_0fb
local_111:
    mov edx, eax
    mov bl, byte [ebx + 0x15]
    and ebx, 0xff
    dec eax
    cmp ebx, 0x47
    je short local_127
    cmp ebx, 0x67
    jne short local_133
local_127:
    xor ebx, ebx
    mov bl, byte [eax]
    cmp ebx, 0x30
    jne short local_133
    dec eax
    jmp short local_127
local_133:
    xor ebx, ebx
    mov bl, byte [eax]
    cmp ebx, 0x2e
    je short local_13d
    inc eax
local_13d:
    mov bl, byte [edx]
    inc edx
    mov byte [eax], bl
    inc eax
    test bl, bl
    jne short local_13d
local_147:
    pop ebx
    ret
