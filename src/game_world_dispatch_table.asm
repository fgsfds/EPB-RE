; Retail dispatch targets for the version-specific world handlers.
bits 32

%define default_handler 0x20918
%define alternate_handler 0x208e1

    dd 0x2086a, alternate_handler
    times 2 dd default_handler
    dd alternate_handler
    times 2 dd default_handler
    dd alternate_handler
    times 4 dd default_handler
    dd alternate_handler
