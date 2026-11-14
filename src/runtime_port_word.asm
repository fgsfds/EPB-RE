; Watcom runtime code.
bits 32
org START_ADDRESS

    push edx
    mov edx, eax
    sub eax, eax
    in ax, dx
    pop edx
    ret
    push ebx
    mov ebx, eax
    mov eax, edx
    mov edx, ebx
    out dx, ax
    pop ebx
    ret
