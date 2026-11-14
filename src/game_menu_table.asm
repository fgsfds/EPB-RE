; Dispatch entries for the full-screen menu.
bits 32

%macro target 1
    dd %1 + MENU_SHIFT
%endmacro

    target 0x14c84
    target 0x1504f
    target 0x15372
    target 0x1516e
    target 0x15c1a
    target 0x15c5f
    times 2 dd 0x15c91 + MENU_SHIFT
    times 2 dd 0x15c5f + MENU_SHIFT
%assign entry 0x15c40
%rep 4
    target entry
    %assign entry entry + 7
%endrep
