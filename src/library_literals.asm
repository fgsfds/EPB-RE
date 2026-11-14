; Shared animation diagnostics and floating-point constants in LE object 3.
bits 32

    db 0, 'net', 0
    db `ANIMLIB_%s: Anim has not been initialized\n`, 0, 0
    db 'findpage', 0, 0, 0, 0
    db 'loadpage', 0, 0, 0, 0
    db 'renderframe', 0
    db 'drawframe', 0, 0, 0
    db 'NumFrames', 0, 0, 0
    db 'DrawFrame', 0, 0, 0
    db 'GetPalette', 0, 0

    db 0, 0, 'inf', 0, 'nan', 0
    dq -1.0

    db 0, 0, 0
%rep 2
    %assign bit 0
    %rep 8
        db 1 << bit
        %assign bit bit + 1
    %endrep
%endrep
    dq 0x7ff0000000000000
