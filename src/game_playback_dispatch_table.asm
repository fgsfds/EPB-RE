; Dispatch target offsets in LE object 1.
bits 32

%if GAME_UPDATE
    dd 0x3726e
    dd 0x37258
    dd 0x375eb
    dd 0x37433
    dd 0x36eaa
    dd 0x36e8f
    dd 0x37090
    dd 0x37075
%else
    dd 0x39d6c
    dd 0x3a0c5
    dd 0x39f17
    dd 0x39a07
    dd 0x39bc1
%endif
