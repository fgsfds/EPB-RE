; Game setup and engine-facing calls.
bits 32
org START_ADDRESS

    push ebx
    push ecx
    push edx
    push esi
    push edi
    push ebp
    sub esp, 0x14
    mov edi, esp
    mov esi, LINK_ADDRESS_1
    mov eax, LINK_ADDRESS_2
    db 0xa5    ; movsd dword es:[edi], dword [esi]
    db 0xa5    ; movsd dword es:[edi], dword [esi]
    db 0xa5    ; movsd dword es:[edi], dword [esi]
    db 0x66, 0xa5    ; movsw word es:[edi], word [esi]
    db 0xa4    ; movsb byte es:[edi], byte [esi]
    call SAFEFILEEXISTS
    test eax, eax
    jne short loc_0036
    push LINK_ADDRESS_2
    push LINK_ADDRESS_4
    call ERROR
    add esp, 8
loc_0036:
    call LINK_ADDRESS_6
    mov eax, LINK_ADDRESS_2
    call LINK_ADDRESS_7
    xor edx, edx
    mov dword [LINK_ADDRESS_8], eax
    mov dword [esp + 0x10], edx
    jmp short loc_0088
loc_0052:
    mov al, byte [esp + 0x10]
    add al, 0x30
    mov byte [esp + 0xd], al
    lea eax, [ebx*4]
    mov ecx, LINK_ADDRESS_9
    add eax, ebx
    mov edx, LINK_ADDRESS_10
    lea eax, [eax*8]
    mov ebx, esp
    add ecx, eax
    mov eax, dword [LINK_ADDRESS_8]
    call LINK_ADDRESS_11
    inc dword [esp + 0x10]
loc_0088:
    mov ebx, dword [esp + 0x10]
    cmp ebx, 0xa
    jl short loc_0052
    mov ecx, LINK_ADDRESS_12
    mov ebx, LINK_ADDRESS_13
    mov edx, LINK_ADDRESS_10
    mov eax, dword [LINK_ADDRESS_8]
    call LINK_ADDRESS_11
    mov eax, LINK_ADDRESS_14
    call CHECKPARM
    and eax, 0xff
    mov dword [esp + 0x10], eax
    je short loc_00d3
    mov edx, dword [ARGV]
    mov edx, dword [edx + eax*4 + 4]
    mov eax, LINK_ADDRESS_12
    call STRCPY
loc_00d3:
    mov eax, LINK_ADDRESS_18
    call CHECKPARM
    and eax, 0xff
    mov dword [esp + 0x10], eax
    je short loc_0132
    mov edx, dword [ARGV]
    mov edx, dword [edx + eax*4 + 4]
    mov eax, LINK_ADDRESS_19
    call STRCPY
    mov edx, 0x2e
    mov eax, LINK_ADDRESS_19
    call LINK_ADDRESS_20
    test eax, eax
    jne short loc_011e
    mov edx, LINK_ADDRESS_21
    mov eax, LINK_ADDRESS_19
    call STRCAT
loc_011e:
    push LINK_ADDRESS_19
    push LINK_ADDRESS_23
    call PRINTF
    add esp, 8
    jmp short loc_013a
loc_0132:
    xor ah, ah
    mov byte [LINK_ADDRESS_19], ah
loc_013a:
%if GAME_UPDATE
    mov ecx, 0x125c70
    mov ebx, 0x3b54
    mov edx, 0x3b14
    mov eax, dword [0x1b8ab0]
    call 0x9ac50
    mov ecx, 0x125d2b
%else
    mov ecx, 0xe9270
    mov ebx, 0x3b30
    mov edx, 0x3af0
    mov eax, dword [0x1273a0]
    call 0x9d790
    mov ecx, 0xe932b
    mov ebx, 0x3b38
    mov edx, 0x3b40
    mov eax, dword [0x1273a0]
    call 0x9d948
    mov ecx, 0xe91f0
    mov ebx, 0x3b50
    mov edx, 0x3b40
    mov eax, dword [0x1273a0]
    call 0x9d790
    mov ecx, 0xe97c7
%endif
    mov ebx, 0x3b5c
%if GAME_UPDATE
    mov edx, 0x3b64
    mov eax, dword [0x1b8ab0]
    call 0x9ae08
    mov ecx, 0x125bf0
    mov ebx, 0x3b74
    mov edx, 0x3b64
    mov eax, dword [0x1b8ab0]
    call 0x9ac50
    mov ecx, 0x1261c7
    mov ebx, 0x3b80
    mov edx, 0x3b64
    mov eax, dword [0x1b8ab0]
    call 0x9ae08
    mov ecx, 0x125d27
    mov ebx, 0x3b88
    mov edx, 0x3b64
    mov eax, dword [0x1b8ab0]
    call 0x9ae08
    mov ecx, 0x125d2f
    mov ebx, 0x3b90
    mov edx, 0x3b64
    mov eax, dword [0x1b8ab0]
    call 0x9ae08
    mov ecx, 0x1b8cb8
    mov ebx, 0x3b9c
    mov edx, 0x3b64
    mov eax, dword [0x1b8ab0]
    call 0x9ae08
    mov ecx, 0x1b8c94
    mov ebx, 0x3ba8
    mov edx, 0x3b64
    mov eax, dword [0x1b8ab0]
    call 0x9ae08
    mov ecx, 0x1b8ca0
%else
    mov edx, 0x3b40
    mov eax, dword [0x1273a0]
    call 0x9d948
    mov ecx, 0xe9327
    mov ebx, 0x3b64
    mov edx, 0x3b40
    mov eax, dword [0x1273a0]
    call 0x9d948
    mov ecx, 0xe932f
    mov ebx, 0x3b6c
    mov edx, 0x3b40
    mov eax, dword [0x1273a0]
    call 0x9d948
    mov ecx, 0x1275a8
    mov ebx, 0x3b78
    mov edx, 0x3b40
    mov eax, dword [0x1273a0]
    call 0x9d948
    mov ecx, 0x127584
    mov ebx, 0x3b84
    mov edx, 0x3b40
    mov eax, dword [0x1273a0]
    call 0x9d948
    mov ecx, 0x127590
    mov ebx, 0x3b94
    mov edx, 0x3b40
    mov eax, dword [0x1273a0]
    call 0x9d948
    mov ecx, 0xe97af
    mov ebx, 0x3ba0
    mov edx, 0x3b40
    mov eax, dword [0x1273a0]
    call 0x9d948
    mov ecx, 0xe934b
    mov ebx, 0x3bac
    mov edx, 0x3b40
    mov eax, dword [0x1273a0]
    call 0x9d948
    mov ecx, 0xe934f
%endif
    mov ebx, 0x3bb8
    mov edx, LINK_ADDRESS_25
    mov eax, dword [LINK_ADDRESS_8]
    call LINK_ADDRESS_26
    mov ecx, LINK_ADDRESS_27
    mov ebx, LINK_ADDRESS_28
    mov edx, LINK_ADDRESS_29
    mov eax, dword [LINK_ADDRESS_8]
    call LINK_ADDRESS_26
    mov ecx, LINK_ADDRESS_30
    mov ebx, 0x3bd0
%if GAME_UPDATE
    mov edx, 0x3b64
    mov eax, dword [0x1b8ab0]
    call 0x9ae08
    mov ecx, 0x125d4f
    mov ebx, 0x3bdc
    mov edx, 0x3b64
    mov eax, dword [0x1b8ab0]
    call 0x9ae08
    mov ecx, 0x125d33
    mov ebx, 0x3be0
    mov edx, 0x3bec
    mov eax, dword [0x1b8ab0]
    call 0x9ae08
    mov ecx, 0x125d37
    mov ebx, 0x3bf4
    mov edi, dword [0x125d33]
    mov edx, 0x3bec
%else
    mov edi, dword [0xe9333]
    mov edx, 0x3bc8
%endif
    inc edi
    mov eax, dword [LINK_ADDRESS_8]
    mov dword [LINK_ADDRESS_31], edi
    call LINK_ADDRESS_26
    mov ecx, LINK_ADDRESS_32
    mov ebx, LINK_ADDRESS_33
    mov edx, LINK_ADDRESS_34
    mov eax, dword [LINK_ADDRESS_8]
    call LINK_ADDRESS_26
    cmp dword [LINK_ADDRESS_35], 0
    jne near loc_038d
    mov eax, dword [LINK_ADDRESS_36]
    test eax, eax
    jne near loc_038d
    mov edx, 3
    mov ebx, 4
    mov ecx, 5
    mov esi, 7
    mov edi, 8
    mov ebp, 6
    mov dword [LINK_ADDRESS_37], eax
    mov dword [LINK_ADDRESS_35], edx
    mov dword [LINK_ADDRESS_36], ebx
    mov dword [LINK_ADDRESS_38], ecx
    mov dword [LINK_ADDRESS_39], esi
    mov dword [LINK_ADDRESS_40], edi
    mov dword [LINK_ADDRESS_41], ebp
    mov edx, 2
    mov ebx, 9
    mov ecx, 1
    xor esi, esi
    mov dword [LINK_ADDRESS_42], edx
    mov dword [LINK_ADDRESS_43], ebx
    mov dword [LINK_ADDRESS_44], ecx
    mov dword [esp + 0x10], esi
    jmp short loc_0384
loc_0348:
    push ebp
    push LINK_ADDRESS_45
    push LINK_ADDRESS_46
    call SPRINTF
    add esp, 0xc
    mov ebx, LINK_ADDRESS_46
    mov ecx, dword [esp + 0x10]
    mov edx, LINK_ADDRESS_34
    lea ecx, [ecx*4]
    mov eax, dword [LINK_ADDRESS_8]
    add ecx, LINK_ADDRESS_35
    call LINK_ADDRESS_26
    inc dword [esp + 0x10]
loc_0384:
    mov ebp, dword [esp + 0x10]
    cmp ebp, 0xa
    jl short loc_0348
loc_038d:
%if GAME_UPDATE
    mov ecx, 0x1b8ce8
%else
    mov ecx, 0x1275d8
    mov ebx, 0x3bf4
    mov edx, 0x3c00
    mov eax, dword [0x1273a0]
    call 0x9d948
    mov ecx, 0x1275d4
    mov ebx, 0x3c0c
    mov edx, 0x3c00
    mov eax, dword [0x1273a0]
    call 0x9d948
    mov ecx, 0x1275c8
%endif
    mov ebx, 0x3c18
%if GAME_UPDATE
    mov edx, 0x3c24
    mov eax, dword [0x1b8ab0]
    call 0x9ae08
    mov ecx, 0x1b8ce4
%else
    mov edx, 0x3c00
    mov eax, dword [0x1273a0]
    call 0x9d948
    mov ecx, 0x1275cc
    mov ebx, 0x3c24
    mov edx, 0x3c00
    mov eax, dword [0x1273a0]
    call 0x9d948
    mov ecx, 0x1273a8
%endif
    mov ebx, 0x3c30
    mov edx, LINK_ADDRESS_48
    mov eax, dword [LINK_ADDRESS_8]
    call LINK_ADDRESS_26
    mov ecx, LINK_ADDRESS_49
    mov ebx, 0x3c3c
    mov edx, LINK_ADDRESS_48
    mov eax, dword [LINK_ADDRESS_8]
    call LINK_ADDRESS_26
    mov ecx, LINK_ADDRESS_50
    mov ebx, 0x3c48
    mov edx, LINK_ADDRESS_48
    mov eax, dword [LINK_ADDRESS_8]
    call LINK_ADDRESS_26
    mov ecx, LINK_ADDRESS_51
    mov ebx, 0x3c54
%if GAME_UPDATE
    mov edx, 0x3c24
    mov eax, dword [0x1b8ab0]
    call 0x9ae08
    mov ecx, 0x1b8ab4
    mov ebx, 0x3c60
    mov edx, 0x3c24
    mov eax, dword [0x1b8ab0]
    call 0x9ae08
    mov ecx, 0x1b8abc
    mov ebx, 0x3c6c
    mov edx, 0x3c24
    mov eax, dword [0x1b8ab0]
    call 0x9ae08
    mov ecx, 0x1b8ac0
    mov ebx, 0x3c78
    mov edx, 0x3c24
    mov eax, dword [0x1b8ab0]
    call 0x9ae08
    mov ecx, 0x1b8ce0
    mov ebx, 0x3c88
    mov edx, 0x3c24
    mov eax, dword [0x1b8ab0]
    call 0x9ae08
    mov ecx, 0x1b8cac
    mov ebx, 0x3c94
    mov edx, 0x3c24
    mov eax, dword [0x1b8ab0]
    call 0x9ae08
    mov ecx, 0x1b8cb0
    mov ebx, 0x3ca0
    mov edx, 0x3c24
    mov eax, dword [0x1b8ab0]
    call 0x9ae08
    mov ecx, 0x1b8c98
    mov ebx, 0x3ca8
    mov edx, 0x3c24
    mov eax, dword [0x1b8ab0]
    call 0x9ae08
    mov ecx, 0x1b8ca4
    mov ebx, 0x3cb0
    mov edx, 0x3c24
    mov eax, dword [0x1b8ab0]
    call 0x9ae08
%else
    mov edx, 0x3c00
    mov eax, dword [0x1273a0]
    call 0x9d948
    mov ecx, 0x1275d0
    mov ebx, 0x3c64
    mov edx, 0x3c00
    mov eax, dword [0x1273a0]
    call 0x9d948
    mov ecx, 0x12759c
    mov ebx, 0x3c70
    mov edx, 0x3c00
    mov eax, dword [0x1273a0]
    call 0x9d948
    mov ecx, 0x1275a0
    mov ebx, 0x3c7c
    mov edx, 0x3c00
    mov eax, dword [0x1273a0]
    call 0x9d948
    mov ecx, 0x127588
    mov ebx, 0x3c84
    mov edx, 0x3c00
    mov eax, dword [0x1273a0]
    call 0x9d948
    mov ecx, 0x127594
    mov ebx, 0x3c8c
    mov edx, 0x3c00
    mov eax, dword [0x1273a0]
    call 0x9d948
%endif
    lea ecx, [esp + 0x10]
    mov ebx, LINK_ADDRESS_52
    mov edx, LINK_ADDRESS_48
    mov eax, dword [LINK_ADDRESS_8]
    call LINK_ADDRESS_26
    mov eax, dword [esp + 0x10]
    lea ecx, [esp + 0x10]
    mov ebx, LINK_ADDRESS_53
    mov edx, LINK_ADDRESS_48
    mov dword [LINK_ADDRESS_54], eax
    mov eax, dword [LINK_ADDRESS_8]
    call LINK_ADDRESS_26
    mov eax, dword [esp + 0x10]
    lea ecx, [esp + 0x10]
    mov ebx, LINK_ADDRESS_55
    mov edx, LINK_ADDRESS_48
    mov dword [LINK_ADDRESS_56], eax
    mov eax, dword [LINK_ADDRESS_8]
    call LINK_ADDRESS_26
    mov eax, dword [esp + 0x10]
    lea ecx, [esp + 0x10]
    mov ebx, LINK_ADDRESS_57
    mov edx, LINK_ADDRESS_48
    mov dword [LINK_ADDRESS_58], eax
    mov eax, dword [LINK_ADDRESS_8]
    call LINK_ADDRESS_26
    mov eax, dword [esp + 0x10]
    lea ecx, [esp + 0x10]
    mov ebx, LINK_ADDRESS_59
    mov edx, LINK_ADDRESS_48
    mov dword [LINK_ADDRESS_60], eax
    mov eax, dword [LINK_ADDRESS_8]
    call LINK_ADDRESS_26
    mov eax, dword [esp + 0x10]
    lea ecx, [esp + 0x10]
    mov ebx, LINK_ADDRESS_61
    mov edx, LINK_ADDRESS_48
    mov dword [LINK_ADDRESS_62], eax
    mov eax, dword [LINK_ADDRESS_8]
    call LINK_ADDRESS_26
    mov eax, dword [esp + 0x10]
    lea ecx, [esp + 0x10]
    mov ebx, LINK_ADDRESS_63
    mov edx, LINK_ADDRESS_48
    mov dword [LINK_ADDRESS_64], eax
    mov eax, dword [LINK_ADDRESS_8]
    call LINK_ADDRESS_26
    mov eax, dword [esp + 0x10]
%if GAME_UPDATE
    mov ecx, 0x1b8ca8
%else
    mov ecx, 0x127598
    mov ebx, 0x3d00
    mov edx, 0x3928
    mov dword [0x1275a4], eax
    mov eax, dword [0x1273a0]
    call 0x9d948
    mov ecx, 0xe97f7
    mov ebx, 0x3d10
    mov edx, 0x3928
    mov eax, dword [0x1273a0]
    call 0x9d948
    mov ecx, 0x12758c
%endif
    mov ebx, 0x3d24
%if GAME_UPDATE
    mov edx, 0x394c
    mov dword [0x1b8cb4], eax
    mov eax, dword [0x1b8ab0]
    call 0x9ae08
    mov ecx, 0x1261f7
    mov ebx, 0x3d34
    mov edx, 0x394c
    mov eax, dword [0x1b8ab0]
    call 0x9ae08
    mov ecx, 0x1b8c9c
    mov ebx, 0x3d48
    mov edx, 0x394c
    mov eax, dword [0x1b8ab0]
    call 0x9ae08
    mov ecx, 0xf19a0
    mov ebx, 0x3d54
    mov edx, 0x394c
    mov eax, dword [0x1b8ab0]
    call 0x9ae08
    mov ecx, 0x92d8
    mov ebx, 0x3d64
    mov edx, 0x394c
    mov eax, dword [0x1b8ab0]
    call 0x9ae08
    call 0x9d8a0
    call 0x58ed0
    mov eax, dword [0x1b8ca8]
%else
    mov edx, 0x3928
    mov eax, dword [0x1273a0]
    call 0x9d948
    mov ecx, 0xb5180
    mov ebx, 0x3d30
    mov edx, 0x3928
    mov eax, dword [0x1273a0]
    call 0x9d948
    mov ecx, 0x9268
    mov ebx, 0x3d40
    mov edx, 0x3928
    mov eax, dword [0x1273a0]
    call 0x9d948
    call 0xa03e0
    call 0x5ba10
    mov eax, dword [0x127598]
%endif
    dec eax
    cmp eax, 5
    ja short loc_065f
    jmp dword cs:[eax*4 + LINK_ADDRESS_65]
    mov eax, dword [LINK_ADDRESS_8]
    call LINK_ADDRESS_66
    jmp short loc_0691
loc_065f:
    mov eax, dword [LINK_ADDRESS_8]
    call LINK_ADDRESS_66
    mov eax, dword [LINK_ADDRESS_8]
    call LINK_ADDRESS_67
    mov dword [LINK_ADDRESS_68], 1
    add esp, 0x14
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    mov eax, dword [LINK_ADDRESS_8]
    call LINK_ADDRESS_69
loc_0691:
    mov dword [LINK_ADDRESS_68], 1
    add esp, 0x14
    pop ebp
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
    db 0x8d, 0x80, 0x00, 0x00, 0x00, 0x00    ; lea eax, [eax]
    db 0x8d, 0x52, 0x00    ; lea edx, [edx]
    db 0x8b, 0xdb    ; mov ebx, ebx
    push ebx
    push ecx
    push edx
    push esi
    cmp dword [LINK_ADDRESS_68], 0
    je near loc_09f9
    push 0
    mov ebx, LINK_ADDRESS_70
    mov edx, LINK_ADDRESS_25
    push 0
    mov ecx, dword [LINK_ADDRESS_71]
    mov eax, dword [LINK_ADDRESS_8]
    call LINK_ADDRESS_72
    mov ecx, LINK_ADDRESS_73
    mov ebx, LINK_ADDRESS_74
    mov edx, LINK_ADDRESS_25
    mov eax, dword [LINK_ADDRESS_8]
    call LINK_ADDRESS_75
    push 0
    mov ebx, LINK_ADDRESS_76
    mov edx, LINK_ADDRESS_25
    push 0
    mov ecx, dword [LINK_ADDRESS_77]
    mov eax, dword [LINK_ADDRESS_8]
    call LINK_ADDRESS_72
    push 0
    mov ebx, LINK_ADDRESS_78
    mov edx, LINK_ADDRESS_25
    push 0
    mov ecx, dword [LINK_ADDRESS_79]
    mov eax, dword [LINK_ADDRESS_8]
    call LINK_ADDRESS_72
    push 0
    mov ebx, LINK_ADDRESS_80
    mov edx, LINK_ADDRESS_25
    push 0
    mov ecx, dword [LINK_ADDRESS_81]
    mov eax, dword [LINK_ADDRESS_8]
    call LINK_ADDRESS_72
    push 0
    mov ebx, LINK_ADDRESS_82
    mov edx, LINK_ADDRESS_25
    push 0
    mov ecx, dword [LINK_ADDRESS_83]
    mov eax, dword [LINK_ADDRESS_8]
    call LINK_ADDRESS_72
    push 0
    mov ebx, LINK_ADDRESS_84
    mov edx, LINK_ADDRESS_48
    push 0
%if GAME_UPDATE
    mov ecx, dword [0x1b8cd8]
    mov eax, dword [0x1b8ab0]
    call 0x9b084
%else
    mov ecx, dword [0x1275c8]
    mov eax, dword [0x1273a0]
    call 0x9dbc4
    push 0
    mov ebx, 0x3c24
    mov edx, 0x3c00
    push 0
    mov ecx, dword [0x1275cc]
    mov eax, dword [0x1273a0]
    call 0x9dbc4
    push 0
    mov ebx, 0x3c30
    mov edx, 0x3c00
    push 0
    mov ecx, dword [0x1273a8]
    mov eax, dword [0x1273a0]
    call 0x9dbc4
%endif
    push 0
    mov ebx, 0x3c48
    mov edx, LINK_ADDRESS_48
    push 0
    mov ecx, dword [LINK_ADDRESS_50]
    mov eax, dword [LINK_ADDRESS_8]
    call LINK_ADDRESS_72
    push 0
    mov ebx, 0x3c54
    mov edx, LINK_ADDRESS_48
    push 0
    mov ecx, dword [LINK_ADDRESS_51]
    mov eax, dword [LINK_ADDRESS_8]
    call LINK_ADDRESS_72
    push 0
    mov ebx, LINK_ADDRESS_85
    mov edx, LINK_ADDRESS_48
    push 0
    mov ecx, dword [LINK_ADDRESS_86]
    mov eax, dword [LINK_ADDRESS_8]
    call LINK_ADDRESS_72
    push 0
    mov ebx, LINK_ADDRESS_87
    mov edx, LINK_ADDRESS_48
    push 0
    mov ecx, dword [LINK_ADDRESS_88]
    mov eax, dword [LINK_ADDRESS_8]
    call LINK_ADDRESS_72
    push 0
    mov ebx, LINK_ADDRESS_89
    mov edx, LINK_ADDRESS_90
    push 0
    mov ecx, dword [LINK_ADDRESS_91]
    mov eax, dword [LINK_ADDRESS_8]
    call LINK_ADDRESS_72
    push 0
    mov ebx, LINK_ADDRESS_92
    mov edx, LINK_ADDRESS_90
    push 0
%if GAME_UPDATE
    mov ecx, dword [0x1b8cb4]
    mov eax, dword [0x1b8ab0]
    call 0x9b084
%else
    mov ecx, dword [0xe97af]
    mov eax, dword [0x1273a0]
    call 0x9dbc4
    push 0
    mov ebx, 0x3bbc
    mov edx, 0x3bc8
    push 0
    mov ecx, dword [0xe9333]
    mov eax, dword [0x1273a0]
    call 0x9dbc4
%endif
    push 0
    mov ebx, 0x3bd0
    mov edx, LINK_ADDRESS_29
    push 0
    mov ecx, dword [LINK_ADDRESS_30]
    mov eax, dword [LINK_ADDRESS_8]
    call LINK_ADDRESS_72
    push 0
    mov ebx, LINK_ADDRESS_93
    mov edx, LINK_ADDRESS_29
    push 0
    mov ecx, dword [LINK_ADDRESS_94]
    mov eax, dword [LINK_ADDRESS_8]
    call LINK_ADDRESS_72
    push 0
    mov ebx, LINK_ADDRESS_95
    mov edx, LINK_ADDRESS_96
    push 0
    mov ecx, dword [LINK_ADDRESS_97]
    mov eax, dword [LINK_ADDRESS_8]
    call LINK_ADDRESS_72
    push 0
    mov ebx, LINK_ADDRESS_98
    mov edx, LINK_ADDRESS_96
    push 0
%if GAME_UPDATE
    mov ecx, dword [0x125d37]
    mov eax, dword [0x1b8ab0]
    call 0x9b084
    push 0
    mov ebx, 0x3bfc
    mov edx, 0x3bec
    push 0
    mov ecx, dword [0x125d53]
    mov eax, dword [0x1b8ab0]
    call 0x9b084
    push 0
    mov ebx, 0x3d34
    mov edx, 0x394c
    push 0
    mov ecx, dword [0x1261f7]
    mov eax, dword [0x1b8ab0]
    call 0x9b084
    push 0
    mov ebx, 0x3d48
    mov edx, 0x394c
    push 0
    mov ecx, dword [0x1b8c9c]
    mov eax, dword [0x1b8ab0]
    call 0x9b084
    movsx edx, word [0x2f2926]
%else
    mov ecx, dword [0x12758c]
    mov eax, dword [0x1273a0]
    call 0x9dbc4
    movsx edx, word [0x261216]
%endif
    mov eax, edx
    shl eax, 7
    sub eax, edx
    push 0
    lea eax, [eax*4]
    mov ebx, LINK_ADDRESS_99
    sub eax, edx
    push 0
    mov edx, LINK_ADDRESS_100
    mov ecx, dword [nosplit eax*2 + LINK_ADDRESS_101]
    mov eax, dword [LINK_ADDRESS_8]
    call LINK_ADDRESS_72
    push 0
    mov ebx, LINK_ADDRESS_102
    mov edx, LINK_ADDRESS_100
    mov ecx, dword [LINK_ADDRESS_103]
    push 0
    mov eax, dword [LINK_ADDRESS_8]
    xor esi, esi
    jmp short loc_09aa
loc_0967:
    push esi
    push LINK_ADDRESS_45
    push LINK_ADDRESS_46
    call SPRINTF
    movsx edx, word [MYCONNECTINDEX]
    mov eax, edx
    add esp, 0xc
    shl eax, 4
    push 0
    add edx, eax
    mov ebx, LINK_ADDRESS_46
    lea edx, [edx*4]
    push 0
    mov eax, dword [LINK_ADDRESS_8]
    mov ecx, dword [edx + esi*4 + LINK_ADDRESS_35]
    mov edx, LINK_ADDRESS_34
    inc esi
loc_09aa:
    call LINK_ADDRESS_72
    cmp esi, 0xa
    jl short loc_0967
    mov eax, dword [LINK_ADDRESS_105]
    cmp eax, 1
    jne short loc_09e0
    call LINK_ADDRESS_106
    push 0
    mov ebx, LINK_ADDRESS_107
    mov edx, LINK_ADDRESS_100
    mov esi, dword [LINK_ADDRESS_8]
    push 0
    mov ecx, eax
    mov eax, esi
    call LINK_ADDRESS_72
loc_09e0:
    mov edx, LINK_ADDRESS_2
    mov eax, dword [LINK_ADDRESS_8]
    call LINK_ADDRESS_108
    mov eax, dword [LINK_ADDRESS_8]
    call LINK_ADDRESS_109
loc_09f9:
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
