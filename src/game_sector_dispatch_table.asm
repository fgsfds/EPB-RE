; Tile event dispatch entries in LE object 1.
bits 32

%define finish_case 0x29829
%define shared_case_a 0x29028
%define shared_case_b 0x2902d
%define shared_case_c 0x2897d

%macro targets 1-*
    %rep %0
        dd %1 - CODE_SHIFT
        %rotate 1
    %endrep
%endmacro

    targets finish_case, 0x292fd, 0x28cca, 0x28f8a, shared_case_a, 0x297bb
    targets shared_case_b, shared_case_b, 0x28b42, shared_case_a, shared_case_a, 0x28fa2
    targets shared_case_c, finish_case, shared_case_c, 0x28408, shared_case_c, finish_case
    targets 0x280cd, 0x28243, 0x282df, 0x2915d, shared_case_a, finish_case
    targets 0x28f8a, 0x2896b, shared_case_c, shared_case_b, shared_case_b, 0x28f8a
    targets 0x290b8, 0x290d6, shared_case_c, 0x28447, shared_case_a, shared_case_a
    targets shared_case_a, finish_case, 0x28f8a, finish_case, 0x28037, shared_case_c
    targets shared_case_a, finish_case, shared_case_b, shared_case_b, shared_case_b, shared_case_a
    targets finish_case, 0x28f8a, shared_case_b, 0x28f7b, shared_case_b, shared_case_c
    targets shared_case_a, 0x28682, 0x287ea, shared_case_a, 0x2963f, 0x28f8a
    targets shared_case_a, 0x28650, finish_case, shared_case_a, shared_case_b, shared_case_b
    targets shared_case_b, finish_case, shared_case_b, shared_case_c, shared_case_c, shared_case_b
    targets shared_case_b, shared_case_a, shared_case_a, shared_case_c, 0x29023, 0x2911b
    targets shared_case_c, shared_case_a, 0x29563, shared_case_c, shared_case_b, shared_case_b
    targets finish_case, finish_case, shared_case_a, shared_case_c, shared_case_c, shared_case_c
    targets shared_case_c, shared_case_b, shared_case_b, shared_case_c, shared_case_c, shared_case_a
    targets finish_case, finish_case, finish_case, 0x28e14, 0x28f8a, shared_case_c
    targets shared_case_c, shared_case_c, shared_case_c, finish_case, shared_case_c, finish_case
    targets 0x2917a, 0x2923b, shared_case_b, shared_case_c, shared_case_a, 0x2861e
    targets 0x285f5, finish_case, shared_case_b, finish_case, finish_case
