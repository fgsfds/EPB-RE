; Two adjacent dispatch tables in LE object 1.
bits 32

%assign case_offset FIRST_TABLE
%rep 7
    dd case_offset
    %assign case_offset case_offset + 9
%endrep
    dd FIRST_TABLE + 0xd5, FIRST_TABLE + 0xe1, FIRST_TABLE + 0xf3
    dd FIRST_TABLE + 0x118, FIRST_TABLE + 0x135, FIRST_TABLE + 0x158
    dd FIRST_TABLE + 0x167

%assign case_offset SECOND_TABLE
%rep 7
    dd case_offset
    %assign case_offset case_offset + 9
%endrep
    dd SECOND_TABLE + 0x18e, SECOND_TABLE + 0x197, SECOND_TABLE + 0x1a6
    dd SECOND_TABLE + 0x1be, SECOND_TABLE + 0x1cd, SECOND_TABLE + 0x1e2
    dd SECOND_TABLE + 0x1f1
