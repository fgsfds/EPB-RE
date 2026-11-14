; Watcom runtime code.
bits 32
org START_ADDRESS

    test eax, eax
    jl short loc_0010
    cmp eax, dword [NFILES]
    jbe near CLOSE
loc_0010:
    mov eax, 4
    call SET_ERRNO
    mov eax, 0xffffffff
    ret
