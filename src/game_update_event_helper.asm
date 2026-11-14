; Update-only player event dispatch.
bits 32
org 0x48758

    db 0x8d, 0x80, 0x00, 0x00, 0x00, 0x00    ; lea eax, [eax]
    db 0x8b, 0xd2    ; mov edx, edx
    push ebx
    push edx
    mov ebx, eax
    mov dx, word [eax + 0x312]
    cmp dx, 1
    jl short loc_487be
    cmp dx, 0x11
    jge short loc_487be
    test dx, dx
    je short loc_487be
    call 0x6dc5f
    test al, 1
    je short loc_48799
    movsx edx, dx
    movsx eax, word [ebx + 0x340]
    db 0x0f, 0xbf, 0x14, 0x55, 0xf0, 0x92, 0x00, 0x00    ; movsx edx, word [edx*2 + 0x92f0]
    jmp short loc_487b9
loc_48799:
    dec edx
    cmp dx, 6
    ja short loc_487be
    xor eax, eax
    mov ax, dx
    jmp dword cs:[eax*4 + 0x3873c]
    mov edx, 0x27d
    movsx eax, word [ebx + 0x340]
loc_487b9:
    call 0x19680
loc_487be:
    pop edx
    pop ebx
    ret
    db 0x8d, 0x40, 0x00    ; lea eax, [eax]
