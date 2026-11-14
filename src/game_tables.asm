; Initialized game tables in LE object 3.
; The second section records the source and target of each string pointer.
bits 32
section .data align=1

%macro emit_string_pointer 1
    [section .fixups follows=.data align=1]
    dd %%site - game_tables, %1
    [section .data align=1]
%%site: dd %1
%endmacro

%macro string_pointer 1-*
    %rep %0
        emit_string_pointer %1
        %rotate 1
    %endrep
%endmacro

%macro roster_pointers 1
    string_pointer %1, %1+4, %1+12, %1+16, %1+24, %1+36
    string_pointer %1+44, %1+52, %1+60, %1+68, %1+76, %1+84
    string_pointer %1+88, %1+96, %1+100, %1+108, %1+120, %1+128
%endmacro

%macro rating_table 0
    dd 10, 21, 30, 50, 10, 40, 50, 80, 80, 10, 10, 40
    dd 44, 80, 99, 99, 99, 99, 20, 15, 44, 80, 70, 76
    dd 50, 15, 10, 33, 10, 40, 44, 80, 99, 99, 99, 99
    dd 10, 10, 20, 10, 10, 10, 50, 40, 40, 50, 10, 10
    dd 10, 10, 99, 99, 99, 99, 73, 80, 87, 40, 45, 88
    dd 88, 78, 80, 70, 72, 56, 84, 60, 99, 99, 99, 99
    dd 50, 70, 50, 20, 88, 60, 80, 34, 41, 80, 70, 66
    dd 44, 80, 99, 99, 99, 99, 500, 70, 500, 200, 880, 60
    dd 180, 234, 141, 480, 570, 766, 244, 380, 999, 999, 999, 999
%endmacro

game_tables:
    times 4 db 0
%if UPDATE
    string_pointer 0x79ac, 0x79b9, 0x79ce, 0x79e3, 0x79f9, 0x7a14
%else
    string_pointer 0x7988, 0x7995, 0x79aa, 0x79bf, 0x79d5, 0x79f0
%endif
    times 112 db 0
    roster_pointers 0x4
    rating_table
%if UPDATE
    dd 1
%endif
    times 20 db 0
    db `PAINT.CON`, 0
    times 334 db 0
    dd -1
    times 12 db 0
    dd 50, 10
    times 12 db 0
    dd 1
%if UPDATE
    times 8 db 0
    dd 80
%endif
    dd -1
    db `cornholio`, 0
    times 4 db 0
    db `stuff`, 0
    times 8 db 0
    db `scotty###`, 0
    times 4 db 0
    db `coords`, 0
    times 7 db 0
    db `view`, 0
    times 9 db 0
    db `time`, 0
    times 9 db 0
    db `unlock`, 0
    times 7 db 0
    db `cashman`, 0
    times 6 db 0
    db `items`, 0
    times 8 db 0
    db `rate`, 0
    times 9 db 0
    db `skill#`, 0
    times 7 db 0
    db `beta`, 0
    times 9 db 0
    db `hyper`, 0
    times 8 db 0
    db `monsters`, 0
    times 5 db 0
    db `<RESERVED>`, 0
    db 0, 0, 0
    db `<RESERVED>`, 0
    db 0, 0, 0
    db `todd`, 0
    times 9 db 0
    db `showmap`, 0
    times 6 db 0
    db `kroz`, 0
    times 9 db 0
    db `allen`, 0
    times 8 db 0
    db `clip`, 0
    times 9 db 0
    db `weapons`, 0
    times 6 db 0
    db `inventory`, 0
    times 4 db 0
    db `keys`, 0
    times 9 db 0
    db `debug`, 0
    times 22 db 0
    dd -1
    db `Duke Nukem 3D(tm) Copyright 1989, 1996 Todd Replogle and 3D Realms Entertainment`, 0
    db `I want to make a game with trees`, 0
    db `16 Possible Dukes`, 0
    dd 1
%if UPDATE
    times 104 db 0
    roster_pointers 0x12bc
%else
    times 100 db 0
    roster_pointers 0x12d0
%endif
    rating_table
%if UPDATE
    dd 1
    times 104 db 0
    roster_pointers 0x13e4
%else
    times 100 db 0
    roster_pointers 0x13f8
%endif
    rating_table
%if UPDATE
    dd 1, 1
    times 104 db 0
    roster_pointers 0x14ec
%else
    times 100 db 0
    roster_pointers 0x14dc
%endif
    rating_table
%if UPDATE
    dd 1
    times 4 db 0
    string_pointer 0x1574, 0x1584, 0x158c, 0x1594, 0x159c, 0x15a4, 0x15b0, 0x15bc
    string_pointer 0x15c4, 0x15d0, 0x15dc, 0x15e4, 0x15f0, 0x15f8, 0x1600, 0x1608
    string_pointer 0x1610, 0x1618, 0x1620, 0x1628, 0x1630, 0x1634, 0x163c, 0x1644
    string_pointer 0x1650, 0x1654, 0x1660, 0x1668, 0x1674, 0x167c, 0x1680, 0x1684
    string_pointer 0x168c, 0x1694, 0x16a0, 0x16ac, 0x16bc, 0x16d0, 0x16d8, 0x16e0
    string_pointer 0x16e4, 0x16ec, 0x16f4, 0x1700, 0x170c, 0x1718, 0x172c, 0x1734
    string_pointer 0x1740, 0x1750, 0x1764, 0x1770, 0x1774, 0x177c, 0x1784, 0x178c
    string_pointer 0x1794, 0x17a0, 0x17ac, 0x17b4, 0x17c0, 0x17d0, 0x17dc, 0x17e4
    string_pointer 0x17f0, 0x17fc, 0x180c, 0x1814, 0x1820, 0x1828, 0x1834, 0x1844
    string_pointer 0x1850, 0x1860, 0x1870, 0x187c, 0x188c, 0x1898, 0x18a0, 0x18ac
    string_pointer 0x18b8, 0x18c0, 0x18d0, 0x18dc, 0x18ec, 0x18f0, 0x18fc, 0x1904
    string_pointer 0x1910, 0x191c, 0x1928, 0x1938, 0x1948, 0x1954, 0x1960, 0x1970
    string_pointer 0x197c, 0x1984, 0x198c, 0x1998, 0x19a0, 0x19ac, 0x19b4, 0x19bc
    string_pointer 0x19c4, 0x19d0, 0x19dc, 0x19e4, 0x19f8, 0x1a08, 0x1a14, 0x1a20
    string_pointer 0x1a2c, 0x1a34
%else
    string_pointer 0x1564, 0x1574, 0x157c, 0x1584, 0x158c, 0x1594, 0x15a0, 0x15ac
    string_pointer 0x15b4, 0x15c0, 0x15cc, 0x15d4, 0x15e0, 0x15e8, 0x15f0, 0x15f8
    string_pointer 0x1600, 0x1608, 0x1610, 0x1618, 0x1620, 0x1624, 0x162c, 0x1634
    string_pointer 0x1640, 0x1644, 0x1650, 0x1658, 0x1664, 0x166c, 0x1670, 0x1674
    string_pointer 0x167c, 0x1684, 0x1690, 0x169c, 0x16ac, 0x16c0, 0x16c8, 0x16d0
    string_pointer 0x16d4, 0x16dc, 0x16e4, 0x16f0, 0x16fc, 0x1708, 0x171c, 0x1724
    string_pointer 0x1730, 0x1740, 0x1754, 0x1760, 0x1764, 0x176c, 0x1774, 0x177c
    string_pointer 0x1784, 0x1790, 0x179c, 0x17a4, 0x17b0, 0x17c0, 0x17cc, 0x17d4
    string_pointer 0x17e0, 0x17ec, 0x17fc, 0x1804, 0x1810, 0x1818, 0x1824, 0x1834
    string_pointer 0x1840, 0x1850, 0x1860, 0x186c, 0x187c, 0x1888, 0x1890, 0x189c
    string_pointer 0x18a8, 0x18b0, 0x18c0, 0x18cc, 0x18dc, 0x18e0, 0x18ec, 0x18f4
    string_pointer 0x1900, 0x190c, 0x1918, 0x1928, 0x1938, 0x1944, 0x1950, 0x1960
    string_pointer 0x196c, 0x1974, 0x197c, 0x1988, 0x1990, 0x199c, 0x19a4, 0x19ac
    string_pointer 0x19b4, 0x19c0, 0x19cc, 0x19d4, 0x19e8, 0x19f8, 0x1a04, 0x1a10
    string_pointer 0x1a1c, 0x1a24
%endif
    times 16 db 0
%if UPDATE
    string_pointer 0x1a68, 0x1a74, 0x1a80
    times 104 db 0
    roster_pointers 0x2568
%else
    string_pointer 0x1a58, 0x1a64, 0x1a70
    times 100 db 0
    roster_pointers 0x254c
%endif
    rating_table
%if UPDATE
    dd 1, 64
%else
    dd 64
%endif
    db 0
    dd 3
%if UPDATE
    db 0x3, 0, 0, 0x5, 0, 0x3, 0, 0x1, 0, 0x4, 0, 0x7
%else
    db 0x3, 0, 0, 0x4, 0, 0x2, 0, 0x1, 0, 0x3, 0, 0x5
%endif
    db 0, 0x2a, 0, 0x2c, 0, 0x2c, 0, 0x39, 0, 0x36, 0, 0x35
    db 0, 0x37, 0
    dd 37
    times 5 db 0
    dd 204
    db 0xff
    dd 1
    db 0, 0
    dd 3, 1
%if UPDATE
    times 120 db 0
    roster_pointers 0x25f0
%else
    times 116 db 0
    roster_pointers 0x25d4
%endif
    rating_table
%if UPDATE
    dd 1
%else
%endif
    times 4 db 0
    db 0xff
    dd 255
    db 0, 0, 0
    dd 1
%if UPDATE
    times 8 db 0
%else
    times 4 db 0
%endif
    db 0xff
    dd 255
%if UPDATE
    times 111 db 0
    roster_pointers 0x2f2c
%else
    times 107 db 0
    roster_pointers 0x2e9c
%endif
    rating_table
%if UPDATE
    dd 1, 200, 20
%else
    dd 200, 35
%endif
    times 4 db 0
    dd 1
    times 12 db 0
    dd 40
    times 8 db 0
    db 0x76, 0x2, 0x77, 0x2, 0x78, 0x2, 0x16, 0, 0x79, 0x2, 0x1a, 0
    db 0x19, 0, 0x1d, 0, 0x1b, 0, 0x18, 0, 0x1a, 0
    dd 25
    times 10 db 0
    dd 128
    dd -1
    dd -1
    dd -1
    dd 128
    dd -1
    dd -1
    dd -1
    dd 128
    dd -1
    dd 128
    dd -1
    db 0
    dd 4, 4, 4, 4
    db 0xa, 0, 0
    dd 128
    db 0
    dd 10, 10, 4, 10, 10, 10, 2, 2
    dd 2, 2
    db 0xa, 0, 0
    dd 128
    db 0
    dd 10, 10, 4, 10, 10, 10, 2, 2
    dd 2, 2
    db 0xa, 0, 0
    dd 128
    db 0
    dd 10, 10, 4, 10, 10, 10, 10, 10
    dd 10, 10, 10, 10, 10, 10, 10, 10
    dd 10, 10, 2, 2, 2, 2, 8, 2
    dd 10, 10, 2, 10, 10
    db 0xa, 0, 0
    dd 128, 128, 128, 128
    db 0, 0xa, 0, 0
    dd 128
    db 0
    dd 10
    db 0xa, 0, 0
    dd 128, 128, 128, 128
    db 0
    dd 6, 6, 6, 6, 10, 6, 6, 6
    dd 6, 6, 6
    db 0x6, 0, 0
    dd -1
    dd -1
    dd -1
    dd -1
    dd -1
    dd -1
    dd -1
    dd -1
    dd -1
    dd -1
    dd -1
    dd -1
    dd 128, 128, 128, 128
    db 0, 0xa, 0, 0
    dd 128
    db 0
    dd 10
    db 0xa, 0, 0
    dd 128, 128, 128, 128
    db 0
    dd 10, 10, 10, 10, 10, 10, 10, 10
    dd 10, 10, 10
    db 0xa, 0, 0
    dd 128, 128, 128, 128
    db 0, 0xa, 0, 0
    dd 128
    db 0
    dd 10
    db 0xa, 0, 0
    dd 128, 128, 128, 128
%if UPDATE
    times 104 db 0
    roster_pointers 0x2fb4
%else
    times 100 db 0
    roster_pointers 0x2f8c
%endif
    rating_table
%if UPDATE
    dd 1, 9
    times 104 db 0
    roster_pointers 0x315c
%else
    dd 9
    times 100 db 0
    roster_pointers 0x3138
%endif
    rating_table
%if UPDATE
    dd 1
    times 104 db 0
    roster_pointers 0x31e4
%else
    times 100 db 0
    roster_pointers 0x31c0
%endif
    rating_table
%if UPDATE
    dd 1
    times 108 db 0
    roster_pointers 0x32d8
%else
    times 104 db 0
    roster_pointers 0x32b4
%endif
    rating_table
%if UPDATE
    dd 1
    times 108 db 0
    roster_pointers 0x347c
%else
    times 104 db 0
    roster_pointers 0x3458
%endif
    rating_table
%if UPDATE
    dd 1
    string_pointer 0x3504, 0x3514, 0x3524, 0x3530, 0x353c, 0x3544, 0x354c, 0x3554
    string_pointer 0x3558, 0x3560, 0x3568, 0x3570, 0x3578, 0x3584, 0x3590, 0x359c
    string_pointer 0x35a8, 0x35b8, 0x35c0, 0x35cc, 0x35d8, 0x35e4, 0x35f0, 0x35fc
    string_pointer 0x3608, 0x3614, 0x3620, 0x362c, 0x3638, 0x3644, 0x3650, 0x3660
    string_pointer 0x3670, 0x367c, 0x3684, 0x3690, 0x3698, 0x36a4, 0x36b0, 0x36b4
    string_pointer 0x36c4, 0x36d4, 0x36e0, 0x36f0, 0x3708, 0x3718, 0x3728, 0x3738
    string_pointer 0x374c, 0x3758, 0x3764, 0x3770
%else
    string_pointer 0x34e0, 0x34f0, 0x3500, 0x350c, 0x3518, 0x3520, 0x3528, 0x3530
    string_pointer 0x3534, 0x353c, 0x3544, 0x354c, 0x3554, 0x3560, 0x356c, 0x3578
    string_pointer 0x3584, 0x3594, 0x359c, 0x35a8, 0x35b4, 0x35c0, 0x35cc, 0x35d8
    string_pointer 0x35e4, 0x35f0, 0x35fc, 0x3608, 0x3614, 0x3620, 0x362c, 0x363c
    string_pointer 0x364c, 0x3658, 0x3660, 0x366c, 0x3674, 0x3680, 0x368c, 0x3690
    string_pointer 0x36a0, 0x36b0, 0x36bc, 0x36cc, 0x36e4, 0x36f4, 0x3704, 0x3714
    string_pointer 0x3728, 0x3734, 0x3740, 0x374c
%endif
    db `PaintB.CFG`, 0
    times 121 db 0
