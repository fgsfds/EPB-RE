; Remaining runtime instructions, constants, and initialized tables.
bits 32
org START_ADDRESS

%if SECTION = 0
; Signed magnitude
    test eax, eax
    jge .return
    neg eax
.return:
    ret
%endif

%if SECTION = 1
; Available stack
    mov eax, esp
    sub eax, dword [STACK_LOW]
    ret
%endif

%if SECTION = 2
; Disable interrupts
    cli
    ret
%endif

%if SECTION = 3
; Enable interrupts
    sti
    ret
%endif

%if SECTION = 4
; Signed minimum
    cmp eax, edx
    jge .select_edx
    ret
.select_edx:
    mov eax, edx
    ret
%endif

%if SECTION = 5
; Scratch slots
    mov eax, SCRATCH_A
    ret
    mov eax, SCRATCH_B
    ret
%endif

%if SECTION = 6
; Block header
    mov eax, dword [eax - 4]
    and al, 0xfe
    sub eax, 4
    ret
%endif

%if SECTION = 7
; Psp address
    mov eax, dword [PSP]
    ret
%endif

%if SECTION = 8
; Stream tail
    jmp near START_ADDRESS + 5 - 0x325e
%endif

%if SECTION = 9
; Runtime return
    ret
%endif

%if SECTION = 10
; Runtime thunk a
    jmp near START_ADDRESS + 5 + 0x101
%endif

%if SECTION = 11
; Runtime thunk b
    jmp near START_ADDRESS + 5 + 0xc8
%endif

%if SECTION = 12
; Ultrasound driver
    db 'ULTRASND', 0, 0, 0, 0
%endif

%if SECTION = 13
; Midi delay name
    db 0, 'MPUDELAY', 0, 0, 0, 0
%endif

%if SECTION = 14
; Animation suffix
    db 0, 0, 'NOAL', 0, 0, 0, 0
%endif

%if SECTION = 15
; Positive scale
    db 0
    dq 0.00390625
%endif

%if SECTION = 16
; Rounding constant
    dq 0x3e45798ee2308c3a
%endif

%if SECTION = 17
; Audio defaults
    dw 0
    dd 1, 1
    dd DATA_LINK_1
%endif

%if SECTION = 18
; Runtime sentinel
    dd -1, 0, 0
%endif

%if SECTION = 19
; Runtime limits
    dd 0x330, 0x5000
%endif

%if SECTION = 20
; Runtime flags
    times 19 db 0
    dd -1
    times 13 db 0
    db 15, 0, 0
%endif

%if SECTION = 21
; Runtime lookup defaults
    times 24 db 0
    dw 0x2f5c
    times 54 db 0
%endif

%if SECTION = 22
; Stream defaults
    times 8 db 0
    dd DATA_LINK_1
    dd DATA_LINK_2
    dd DATA_LINK_3
    db 0x1, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x20, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0
%endif

%if SECTION = 23
; Runtime messages
    db 0xf, 0x0, 0x0, 0x0
    dd DATA_LINK_1
    dd DATA_LINK_2
    dd DATA_LINK_3
    dd DATA_LINK_4
    dd DATA_LINK_5
    dd DATA_LINK_6
    dd DATA_LINK_7
    dd DATA_LINK_8
    dd DATA_LINK_9
    dd DATA_LINK_10
    dd DATA_LINK_11
    dd DATA_LINK_12
    dd DATA_LINK_13
    dd DATA_LINK_14
    dd DATA_LINK_15
    dd DATA_LINK_16
    times 4 db 0
%endif

%if SECTION = 24
; Runtime callback
    times 61 db 0
    dd DATA_LINK_1
    times 91 db 0
%endif

%if SECTION = 25
; Runtime state
    dd DATA_LINK_1
    dd DATA_LINK_2
    db 0x1, 0x0, 0x0, 0x0, 0x10, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x7f, 0x12, 0x0, 0x0
    dd DATA_LINK_3
    dd DATA_LINK_4
    dd DATA_LINK_5
    dd DATA_LINK_6
    dd DATA_LINK_7
    dd DATA_LINK_8
    dd DATA_LINK_9
    dd DATA_LINK_10
    dd DATA_LINK_11
    dd DATA_LINK_12
    dd DATA_LINK_13
    dd DATA_LINK_14
    dd DATA_LINK_15
    dd DATA_LINK_16
    dd DATA_LINK_17
    dd DATA_LINK_18
    dd DATA_LINK_19
    dd DATA_LINK_20
    dd DATA_LINK_21
    dd DATA_LINK_22
    dd DATA_LINK_23
    dd DATA_LINK_24
    dd DATA_LINK_25
    dd DATA_LINK_26
    dd DATA_LINK_27
    db 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x11, 0x0, 0x0, 0x0
    dd DATA_LINK_28
%endif

%if SECTION = 26
; Runtime finalizer
    dd DATA_LINK_1
    times 12 db 0
%endif

%if SECTION = 27
; Startup entries
    db 0x2, 0xd, 0x75, 0x20, 0xa0, 0x0, 0x0, 0x1
    dd DATA_LINK_1
    times 2 db 0
    dd DATA_LINK_2
    db 0x0, 0x3
    dd DATA_LINK_3
    times 2 db 0
    dd DATA_LINK_4
    db 0x0, 0x2
    dd DATA_LINK_5
    times 2 db 0
    dd DATA_LINK_6
    times 2 db 0
    dd DATA_LINK_7
    times 2 db 0
    dd DATA_LINK_8
    db 0x0, 0x20
    dd DATA_LINK_9
    db 0x0, 0x20
    dd DATA_LINK_10
    db 0x0, 0x20
    dd DATA_LINK_11
    db 0x0, 0x20
    dd DATA_LINK_12
    db 0x0, 0x1
    dd DATA_LINK_13
    db 0x0, 0x2
    dd DATA_LINK_14
    db 0x0, 0x20
    dd DATA_LINK_15
    db 0x0, 0x20
    dd DATA_LINK_16
    db 0x0, 0x3
    dd DATA_LINK_17
    db 0x0, 0x1
    dd DATA_LINK_18
    db 0x0, 0x20
    dd DATA_LINK_19
    db 0x0, 0x1, 0x0, 0x0, 0x4, 0x0, 0x0, 0x7, 0x0, 0x0, 0xa, 0x0, 0x0, 0xd, 0x0, 0x0, 0x0, 0x0, 0x70, 0x3f, 0x0, 0x0, 0x88, 0x3f, 0x0, 0x0, 0x0, 0x5f
    dd DATA_LINK_20
    dd DATA_LINK_21
    dd DATA_LINK_22
    dd DATA_LINK_23
    dd DATA_LINK_24
    dd DATA_LINK_25
    dd DATA_LINK_26
    dd DATA_LINK_27
    dd DATA_LINK_28
    dd DATA_LINK_29
    dd DATA_LINK_30
    dd DATA_LINK_31
    dd DATA_LINK_32
    dd DATA_LINK_33
    dd DATA_LINK_34
    dd DATA_LINK_35
    dd DATA_LINK_36
    dd DATA_LINK_37
    dd DATA_LINK_38
    dd DATA_LINK_39
    dd DATA_LINK_40
    dd DATA_LINK_41
    dd DATA_LINK_42
    dd DATA_LINK_43
    dd DATA_LINK_44
    dd DATA_LINK_45
    dd DATA_LINK_46
    dd DATA_LINK_47
    dd DATA_LINK_48
    dd DATA_LINK_49
    dd DATA_LINK_50
    dd DATA_LINK_51
    dd DATA_LINK_52
    dd DATA_LINK_53
    dd DATA_LINK_54
    dd DATA_LINK_55
    dd DATA_LINK_56
    dd DATA_LINK_57
    dd DATA_LINK_58
    dd DATA_LINK_59
    dd DATA_LINK_60
    dd DATA_LINK_61
    dd DATA_LINK_62
    dd DATA_LINK_63
    dd DATA_LINK_64
    dd DATA_LINK_65
    dd DATA_LINK_66
    dd DATA_LINK_67
    dd DATA_LINK_68
    dd DATA_LINK_69
    dd DATA_LINK_70
    dd DATA_LINK_71
    dd DATA_LINK_72
    dd DATA_LINK_73
    dd DATA_LINK_74
    dd DATA_LINK_75
    dd DATA_LINK_76
    dd DATA_LINK_77
    dd DATA_LINK_78
    dd DATA_LINK_79
    dd DATA_LINK_80
    dd DATA_LINK_81
    dd DATA_LINK_82
    dw DATA_LINK_83 & 0xffff
    db DATA_LINK_83 >> 16
%endif
