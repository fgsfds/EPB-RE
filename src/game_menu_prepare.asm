; Prepare the full-screen menu view.
bits 32
org START_ADDRESS

    push ebx
    push ecx
    push edx
    push esi
    push edi
    push ebp
    mov ecx, dword [YDIM]
    mov ebx, dword [XDIM]
    xor edx, edx
    xor eax, eax
    dec ecx
    dec ebx
    xor esi, esi
    call SETVIEW
    jmp short loc_0032
loc_0021:
    movsx ecx, si
    xor ebx, ebx
    xor edx, edx
    xor eax, eax
    call LINK_ADDRESS_4
    add esi, 7
loc_0032:
    cmp si, 0x3f
    jl short loc_0021
    movsx ecx, word [MYCONNECTINDEX]
    mov eax, ecx
    shl eax, 7
    sub eax, ecx
    lea eax, [eax*4]
    sub eax, ecx
    mov edx, PALETTE
    xor ebx, ebx
    mov dword [nosplit eax*2 + LINK_ADDRESS_7], edx
    mov dword [TOTALCLOCK], ebx
    call LINK_ADDRESS_9
    mov eax, dword [YDIM]
    dec eax
    push eax
    mov eax, dword [XDIM]
    dec eax
    push eax
    push ebx
    push ebx
    push 0x5a
    push ebx
    xor ecx, ecx
    push ebx
    xor edx, edx
    xor eax, eax
    push 0xcc6
    mov ebx, 0x10000
    mov esi, 0x3f
    call LINK_ADDRESS_10
    call LINK_ADDRESS_11
    jmp short loc_00ae
loc_009d:
    movsx ecx, si
    xor ebx, ebx
    xor edx, edx
    xor eax, eax
    call LINK_ADDRESS_4
    sub esi, 7
loc_00ae:
    test si, si
    jg short loc_009d
    xor ecx, ecx
    mov dword [TOTALCLOCK], ecx
loc_00bb:
    call LINK_ADDRESS_12
    test eax, eax
    jne short loc_00cb
    call 0x10800
    jmp short loc_00bb
loc_00cb:
    xor esi, esi
    jmp short loc_00e0
loc_00cf:
    movsx ecx, si
    xor ebx, ebx
    xor edx, edx
    xor eax, eax
    call LINK_ADDRESS_4
    add esi, 7
loc_00e0:
    cmp si, 0x3f
    jl short loc_00cf
    xor esi, esi
    mov dword [TOTALCLOCK], esi
    call LINK_ADDRESS_9
    mov eax, dword [YDIM]
    dec eax
    push eax
    mov eax, dword [XDIM]
    dec eax
    push eax
    push esi
    push esi
    push 0x5a
    push esi
    mov ebx, 0x10000
    push esi
    xor ecx, ecx
    xor edx, edx
    push 0xcc7
    xor eax, eax
    mov esi, 0x3f
    call LINK_ADDRESS_10
    call LINK_ADDRESS_11
    jmp short loc_0139
loc_0128:
    movsx ecx, si
    xor ebx, ebx
    xor edx, edx
    xor eax, eax
    call LINK_ADDRESS_4
    sub esi, 7
loc_0139:
    test si, si
    jg short loc_0128
    xor edi, edi
    mov dword [TOTALCLOCK], edi
loc_0146:
    call LINK_ADDRESS_12
    test eax, eax
    jne short loc_0156
    call 0x10800
    jmp short loc_0146
loc_0156:
    xor esi, esi
    jmp short loc_016b
loc_015a:
    movsx ecx, si
    xor ebx, ebx
    xor edx, edx
    xor eax, eax
    call LINK_ADDRESS_4
    add esi, 7
loc_016b:
    cmp si, 0x3f
    jl short loc_015a
    xor ebp, ebp
    mov dword [TOTALCLOCK], ebp
    call LINK_ADDRESS_9
    mov eax, dword [YDIM]
    dec eax
    push eax
    mov eax, dword [XDIM]
    dec eax
    push eax
    push ebp
    push ebp
    push 0x5a
    push ebp
    mov ebx, 0x10000
    push ebp
    xor ecx, ecx
    xor edx, edx
    push 0xcc8
    xor eax, eax
    mov esi, 0x3f
    call LINK_ADDRESS_10
    call LINK_ADDRESS_11
    jmp short loc_01c4
loc_01b3:
    movsx ecx, si
    xor ebx, ebx
    xor edx, edx
    xor eax, eax
    call LINK_ADDRESS_4
    sub esi, 7
loc_01c4:
    test si, si
    jg short loc_01b3
    xor eax, eax
    mov dword [TOTALCLOCK], eax
loc_01d0:
    call LINK_ADDRESS_12
    test eax, eax
    jne short loc_01e0
    call 0x10800
    jmp short loc_01d0
loc_01e0:
    xor esi, esi
    jmp short loc_01f5
loc_01e4:
    movsx ecx, si
    xor ebx, ebx
    xor edx, edx
    xor eax, eax
    call LINK_ADDRESS_4
    add esi, 7
loc_01f5:
    cmp si, 0x3f
    jl short loc_01e4
    xor edx, edx
    mov dword [TOTALCLOCK], edx
    call LINK_ADDRESS_9
    mov eax, dword [YDIM]
    dec eax
    push eax
    mov eax, dword [XDIM]
    dec eax
    push eax
    push edx
    push edx
    push 0x5a
    push edx
    push edx
    mov ebx, 0x10000
    xor ecx, ecx
    push 0xcc9
    xor eax, eax
    mov esi, 0x3f
    call LINK_ADDRESS_10
    call LINK_ADDRESS_11
    jmp short loc_024c
loc_023b:
    movsx ecx, si
    xor ebx, ebx
    xor edx, edx
    xor eax, eax
    call LINK_ADDRESS_4
    sub esi, 7
loc_024c:
    test si, si
    jg short loc_023b
    xor ebx, ebx
    mov dword [TOTALCLOCK], ebx
loc_0259:
    call LINK_ADDRESS_12
    test eax, eax
    jne near LINK_ADDRESS_13
    call 0x10800
    jmp short loc_0259
    db 0x8d, 0x40, 0x00    ; lea eax, [eax]
