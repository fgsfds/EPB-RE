; Watcom runtime code.
bits 32
org START_ADDRESS

    push ebx
    mov ebx, eax
    mov al, dl
    mov edx, ebx
    out dx, al
    pop ebx
    ret
    push edx
    mov edx, eax
    sub eax, eax
    in al, dx
    pop edx
    ret
    db 0x00
