; Alignment after the update sprite dispatch table.
bits 32
    db 0x8d, 0x44, 0x20, 0x00    ; lea eax, [eax + 0] with SIB encoding
