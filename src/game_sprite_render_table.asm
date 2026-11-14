; Animation cases used during sprite rendering.
bits 32

%if GAME_UPDATE
    dd BASE + 0xe6e8
%endif
    dd BASE + 0xe6e8, BASE + 0xe6fe, BASE + 0xe6dd
%if GAME_UPDATE
    dd BASE + 0xe6f3
%endif
    dd BASE + 0xe6f3, BASE + 0xe709
%if GAME_UPDATE
    dd BASE + 0xe709
%endif
    dd BASE + 0xeb26, BASE + 0xeb49, BASE + 0xeb49, BASE + 0xeb82
    dd BASE + 0xec48, BASE + 0xebd5, BASE + 0xec25
