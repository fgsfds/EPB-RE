; Four feedback cases in LE object 1.
bits 32

%assign handler FIRST_HANDLER
%rep 4
    dd handler
    %assign handler handler + 7
%endrep
