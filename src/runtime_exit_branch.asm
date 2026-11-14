; Watcom runtime code.
bits 32
org START_ADDRESS

    db 0x00
    jmp near LINK_ADDRESS_1
    test eax, eax
    jne near FLUSH
    call LINK_ADDRESS_3
    xor eax, eax
    ret
