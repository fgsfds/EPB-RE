bits 32
org START_ADDRESS

    push esi
    push edi
    push es
    push ebp
    sub esp, 0x124
    mov esi, ebx
    mov dword [esp + 0x11c], ecx
    xor bl, bl
    mov dword [esp + 0x100], eax
    mov byte [esp + 0x120], bl
    mov byte [esp + 0x114], bl
    xor ebx, ebx
    mov edi, edx
    mov dword [esp + 0x110], ebx
    mov ebp, 4
    jmp near local_004
local_000:
    lea ebx, [esp + 0x100]
    mov edx, esi
    call local_028
    mov edi, eax
    mov al, byte [eax]
    inc edi
    mov byte [esp + 0x115], al
    test al, al
    je near local_027
    xor eax, eax
    mov al, byte [esp + 0x115]
    cmp eax, 0x6e
    jne near local_013
    mov al, byte [esp + 0x114]
    xor edx, edx
    and al, 0x20
    mov dl, al
    mov al, byte [esp + 0x114]
    and al, 0x40
    mov ah, byte [esp + 0x114]
    and ah, 0x80
    test edx, edx
    je near local_006
    xor edx, edx
    mov dl, ah
    test edx, edx
    je short local_002
    mov ecx, dword [esi]
    add ecx, 8
    mov dword [esi], ecx
    les edx, [ecx - 8]
local_001:
    mov eax, dword [esp + 0x110]
    mov dword es:[edx], eax
    jmp short local_004
local_002:
    and eax, 0xff
    je short local_005
    mov ebx, dword [esi]
    add ebx, ebp
    mov dword [esi], ebx
    mov edx, dword [ebx - 4]
local_003:
    mov eax, dword [esp + 0x110]
    mov dword [edx], eax
local_004:
    mov cl, byte [edi]
    test cl, cl
    je near local_027
    xor edx, edx
    mov dl, cl
    lea eax, [edi + 1]
    cmp edx, 0x25
    je near local_000
    mov edi, eax
    lea eax, [esp + 0x100]
    call dword [esp + 0x11c]
    jmp short local_004
local_005:
    mov edx, dword [esi]
    add edx, ebp
    mov dword [esi], edx
    mov edx, dword [edx - 4]
    jmp short local_003
local_006:
    mov dl, byte [esp + 0x114]
    and dl, 0x10
    and edx, 0xff
    je short local_010
    xor edx, edx
    mov dl, ah
    test edx, edx
    je short local_007
    mov eax, dword [esi]
    add eax, 8
    mov dword [esi], eax
    les edx, [eax - 8]
    mov eax, dword [esp + 0x110]
    db 0x66, 0x26, 0x89, 0x02    ; mov word es:[edx], ax
    jmp short local_004
local_007:
    and eax, 0xff
    je short local_009
    mov ecx, dword [esi]
    add ecx, ebp
    mov dword [esi], ecx
    mov edx, dword [ecx - 4]
local_008:
    mov eax, dword [esp + 0x110]
    mov word [edx], ax
    jmp near local_004
local_009:
    mov ebx, dword [esi]
    add ebx, ebp
    mov dword [esi], ebx
    mov edx, dword [ebx - 4]
    jmp short local_008
local_010:
    mov dl, ah
    test edx, edx
    je short local_011
    mov edx, dword [esi]
    add edx, 8
    mov dword [esi], edx
    les edx, [edx - 8]
    jmp near local_001
local_011:
    and eax, 0xff
    je short local_012
    mov eax, dword [esi]
    add eax, ebp
    mov dword [esi], eax
    mov edx, dword [eax - 4]
    jmp near local_003
local_012:
    mov ecx, dword [esi]
    add ecx, ebp
    mov dword [esi], ecx
    mov edx, dword [ecx - 4]
    jmp near local_003
local_013:
    lea ecx, [esp + 0x120]
    lea ebx, [esp + 0x100]
    mov eax, esp
    mov edx, esi
    call local_082
    mov ebx, eax
    mov al, byte [esp + 0x114]
    mov es, edx
    and al, 8
    and eax, 0xff
    jne short local_015
    mov al, byte [esp + 0x116]
    cmp eax, 0x20
    jne short local_015
local_014:
    mov eax, dword [esp + 0x104]
    dec eax
    mov dword [esp + 0x104], eax
    test eax, eax
    jl short local_015
    xor edx, edx
    lea eax, [esp + 0x100]
    mov dl, byte [esp + 0x116]
    call dword [esp + 0x11c]
    jmp short local_014
local_015:
    lea ecx, [esp + 0x117]
local_016:
    mov al, byte [ecx]
    test al, al
    je short local_017
    xor edx, edx
    mov dl, al
    lea eax, [esp + 0x100]
    inc ecx
    call dword [esp + 0x11c]
    jmp short local_016
local_017:
    mov eax, dword [esp + 0x10c]
    lea ecx, [eax - 1]
    mov dword [esp + 0x10c], ecx
    test eax, eax
    je short local_018
    mov edx, 0x30
    lea eax, [esp + 0x100]
    call dword [esp + 0x11c]
    jmp short local_017
local_018:
    mov al, byte [esp + 0x114]
    and al, 8
    and eax, 0xff
    jne short local_020
    mov al, byte [esp + 0x116]
    cmp eax, 0x20
    je short local_020
local_019:
    mov eax, dword [esp + 0x104]
    dec eax
    mov dword [esp + 0x104], eax
    test eax, eax
    jl short local_020
    xor edx, edx
    lea eax, [esp + 0x100]
    mov dl, byte [esp + 0x116]
    call dword [esp + 0x11c]
    jmp short local_019
local_020:
    xor eax, eax
    mov al, byte [esp + 0x115]
    cmp eax, 0x73
    je short local_021
    cmp eax, 0x53
    jne short local_024
local_021:
    mov al, byte [esp + 0x114]
    and al, 0x20
    and eax, 0xff
    je short local_023
local_022:
    mov eax, dword [esp + 0x108]
    lea ecx, [eax - 1]
    mov dword [esp + 0x108], ecx
    test eax, eax
    je near local_025
    xor edx, edx
    lea eax, [esp + 0x100]
    mov dl, byte es:[ebx]
    call dword [esp + 0x11c]
    add ebx, 2
    jmp short local_022
local_023:
    mov eax, dword [esp + 0x108]
    lea edx, [eax - 1]
    mov dword [esp + 0x108], edx
    test eax, eax
    je short local_025
    xor edx, edx
    lea eax, [esp + 0x100]
    mov dl, byte es:[ebx]
    call dword [esp + 0x11c]
    inc ebx
    jmp short local_023
local_024:
    mov eax, dword [esp + 0x108]
    lea ecx, [eax - 1]
    mov dword [esp + 0x108], ecx
    test eax, eax
    je short local_025
    xor edx, edx
    lea eax, [esp + 0x100]
    mov dl, byte es:[ebx]
    call dword [esp + 0x11c]
    inc ebx
    jmp short local_024
local_025:
    mov al, byte [esp + 0x114]
    and al, 8
    and eax, 0xff
    je near local_004
    cmp dword [esp + 0x104], 0
    jle near local_004
local_026:
    mov eax, dword [esp + 0x104]
    lea edx, [eax - 1]
    mov dword [esp + 0x104], edx
    test eax, eax
    je near local_004
    mov edx, 0x20
    lea eax, [esp + 0x100]
    call dword [esp + 0x11c]
    jmp short local_026
local_027:
    mov eax, dword [esp + 0x110]
    add esp, 0x124
    pop ebp
    pop es
    pop edi
    pop esi
    ret
local_028:
    push ecx
    push esi
    push edi
    mov esi, edx
    mov byte [ebx + 0x17], 0
    mov edx, ebx
    mov byte [ebx + 0x16], 0x20
    call local_046
    mov dword [ebx + 4], 0
    mov dl, byte [eax]
    and edx, 0xff
    cmp edx, 0x30
    jl short local_030
    cmp edx, 0x39
    jg short local_030
local_029:
    imul ecx, dword [ebx + 4], 0xa
    xor edx, edx
    mov dl, byte [eax]
    sub edx, 0x30
    inc eax
    add ecx, edx
    xor edx, edx
    mov dword [ebx + 4], ecx
    mov dl, byte [eax]
    cmp edx, 0x30
    jl short local_032
    cmp edx, 0x39
    jle short local_029
    jmp short local_032
local_030:
    xor edx, edx
    mov dl, byte [eax]
    cmp edx, 0x2a
    jne short local_032
    mov edx, dword [esi]
    add edx, 4
    mov dword [esi], edx
    mov edx, dword [edx - 4]
    mov dword [ebx + 4], edx
    test edx, edx
    jge short local_031
    mov edi, edx
    mov dl, byte [ebx + 0x14]
    neg edi
    or dl, 8
    mov dword [ebx + 4], edi
    mov byte [ebx + 0x14], dl
local_031:
    inc eax
local_032:
    mov dword [ebx + 8], 0xffffffff
    xor edx, edx
    mov dl, byte [eax]
    cmp edx, 0x2e
    jne short local_035
    inc eax
    mov dword [ebx + 8], 0
    xor edx, edx
    mov dl, byte [eax]
    cmp edx, 0x2a
    jne short local_034
    mov edx, dword [esi]
    add edx, 4
    mov dword [esi], edx
    mov edx, dword [edx - 4]
    mov dword [ebx + 8], edx
    test edx, edx
    jge short local_033
    mov dword [ebx + 8], 0xffffffff
local_033:
    inc eax
    jmp short local_035
local_034:
    xor edx, edx
    mov dl, byte [eax]
    cmp edx, 0x30
    jl short local_035
    cmp edx, 0x39
    jg short local_035
    imul ecx, dword [ebx + 8], 0xa
    sub edx, 0x30
    add ecx, edx
    inc eax
    mov dword [ebx + 8], ecx
    jmp short local_034
local_035:
    mov dl, byte [eax]
    lea ecx, [eax + 1]
    cmp dl, 0x4e
    jb short local_037
    jbe short local_043
    cmp dl, 0x6c
    jb short local_036
    jbe short local_038
    cmp dl, 0x77
    je short local_038
    pop edi
    pop esi
    pop ecx
    ret
local_036:
    cmp dl, 0x68
    je short local_040
    pop edi
    pop esi
    pop ecx
    ret
local_037:
    cmp dl, 0x46
    jb short local_045
    jbe short local_042
    cmp dl, 0x4c
    je short local_041
    pop edi
    pop esi
    pop ecx
    ret
local_038:
    mov dh, byte [ebx + 0x14]
    or dh, 0x20
    inc eax
local_039:
    mov byte [ebx + 0x14], dh
    pop edi
    pop esi
    pop ecx
    ret
local_040:
    or byte [ebx + 0x14], 0x10
    jmp short local_044
local_041:
    mov dl, byte [ebx + 0x14]
    or dl, 0x40
    mov eax, ecx
    mov byte [ebx + 0x14], dl
    pop edi
    pop esi
    pop ecx
    ret
local_042:
    mov dh, byte [ebx + 0x14]
    or dh, 0x80
    mov eax, ecx
    jmp short local_039
local_043:
    or byte [ebx + 0x14], 0x40
local_044:
    mov eax, ecx
local_045:
    pop edi
    pop esi
    pop ecx
    ret
local_046:
    push ebx
    push ecx
    mov ebx, eax
    mov byte [edx + 0x14], 0
local_047:
    xor eax, eax
    mov al, byte [ebx]
    cmp eax, 0x2d
    jne short local_048
    or byte [edx + 0x14], 8
    jmp short local_052
local_048:
    cmp eax, 0x23
    jne short local_049
    or byte [edx + 0x14], 1
    jmp short local_052
local_049:
    cmp eax, 0x2b
    jne short local_050
    mov cl, byte [edx + 0x14]
    or cl, 4
    mov ch, cl
    and ch, 0xfd
    mov byte [edx + 0x14], ch
    jmp short local_052
local_050:
    cmp eax, 0x20
    jne short local_051
    mov al, byte [edx + 0x14]
    and al, 4
    and eax, 0xff
    jne short local_052
    or byte [edx + 0x14], 2
    jmp short local_052
local_051:
    cmp eax, 0x30
    jne short local_053
    mov byte [edx + 0x16], 0x30
local_052:
    inc ebx
    jmp short local_047
local_053:
    mov eax, ebx
    pop ecx
    pop ebx
    ret
local_054:
    push ecx
    push esi
    push edi
    push es
    mov ecx, edx
    mov edi, ebx
    mov edx, eax
    mov es, ecx
    xor eax, eax
local_055:
    mov esi, edx
    mov bl, byte es:[esi]
    inc edx
    test bl, bl
    je short local_056
    cmp eax, edi
    je short local_056
    inc eax
    jmp short local_055
local_056:
    pop es
    pop edi
    pop esi
    pop ecx
    ret
local_057:
    push ecx
    push esi
    push edi
    push es
    mov ecx, eax
    mov esi, ebx
    mov ebx, ecx
    mov es, edx
    xor eax, eax
local_058:
    mov ecx, ebx
    db 0x66, 0x26, 0x8b, 0x39    ; mov di, word es:[ecx]
    add ebx, 2
    test di, di
    je short local_056
    cmp eax, esi
    je short local_056
    inc eax
    jmp short local_058
local_059:
    push ecx
    push esi
    push edi
    push ebp
    sub esp, 4
    mov ebp, edx
    mov dword [esp], ebx
    mov ebx, 0x10
    mov edi, ebp
    call LINK_ADDRESS_1
    push es
    mov eax, ds
    mov es, eax
    sub ecx, ecx
    dec ecx
    xor eax, eax
    db 0xf2, 0xae    ; repne scasb al, byte es:[edi]
    not ecx
    dec ecx
    pop es
    mov eax, dword [esp]
    mov esi, ebp
    dec eax
    lea edx, [ecx + ebp]
    lea ebx, [eax + ebp]
    jmp short local_061
local_060:
    dec edx
    mov cl, byte [edx]
    dec eax
    mov byte [ebx], cl
    dec ebx
local_061:
    cmp edx, esi
    jne short local_060
    lea edx, [eax + ebp]
local_062:
    test eax, eax
    jl short local_063
    dec eax
    mov byte [edx], 0x30
    dec edx
    jmp short local_062
local_063:
    add ebp, dword [esp]
    mov byte [ebp], 0
    add esp, 4
    pop ebp
    pop edi
    pop esi
    pop ecx
    ret
local_064:
    push ecx
    push esi
    push edi
    sub esp, 4
    mov ecx, eax
    mov esi, ebx
    mov dword [esp], edx
    test edx, edx
    jge short local_065
    neg edx
    lea ecx, [eax + 1]
    mov byte [eax], 0x2d
    mov dword [esp], edx
local_065:
    cmp dword [esi + 8], -1
    jne short local_066
    mov dword [esi + 8], 4
local_066:
    mov ebx, 0xa
    xor eax, eax
    mov edx, ecx
    mov ax, word [esp + 2]
    call LINK_ADDRESS_1
    mov ebx, ecx
local_067:
    mov ah, byte [ecx]
    lea edx, [ecx + 1]
    test ah, ah
    je short local_068
    mov ecx, edx
    jmp short local_067
local_068:
    cmp dword [esi + 8], 0
    je short local_071
    mov byte [ecx], 0x2e
    xor eax, eax
    mov ecx, edx
    jmp short local_070
local_069:
    xor edx, edx
    mov word [esp + 2], dx
    mov edi, dword [esp]
    imul edx, edi, 0xa
    mov dword [esp], edx
    mov dl, byte [esp + 2]
    add dl, 0x30
    inc eax
    mov byte [ecx], dl
    inc ecx
local_070:
    cmp eax, dword [esi + 8]
    jl short local_069
    mov byte [ecx], 0
local_071:
    mov eax, dword [esp]
    xor al, al
    and ah, 0x80
    and eax, 0xffff
    je near local_080
local_072:
    cmp ecx, ebx
    jne short local_077
    lea ecx, [ebx + 1]
    mov byte [ebx], 0x31
local_073:
    xor edx, edx
    mov dl, byte [ecx]
    lea eax, [ecx + 1]
    cmp edx, 0x30
    jne short local_074
    mov ecx, eax
    jmp short local_073
local_074:
    cmp edx, 0x2e
    jne short local_076
    mov byte [ecx], 0x30
    lea ecx, [eax + 1]
    mov byte [eax], 0x2e
local_075:
    xor eax, eax
    mov al, byte [ecx]
    cmp eax, 0x30
    jne short local_076
    inc ecx
    jmp short local_075
local_076:
    mov byte [ecx], 0x30
    inc ecx
    mov byte [ecx], 0
    jmp short local_080
local_077:
    dec ecx
    xor eax, eax
    mov al, byte [ecx]
    cmp eax, 0x2e
    jne short local_078
    dec ecx
local_078:
    xor eax, eax
    mov al, byte [ecx]
    cmp eax, 0x39
    je short local_079
    mov dl, al
    inc dl
    mov byte [ecx], dl
    jmp short local_080
local_079:
    mov byte [ecx], 0x30
    jmp short local_072
local_080:
    add esp, 4
    pop edi
    pop esi
    pop ecx
    ret
local_081:
    call dword [LINK_ADDRESS_2]
    ret
local_082:
    push esi
    push edi
    push es
    push ebp
    sub esp, 0xc
    mov edi, eax
    mov esi, ebx
    mov dword [esp + 4], ecx
    mov eax, edx
    mov dword [esp], 1
    mov edx, ds
    mov ecx, edi
    mov es, edx
    mov dl, byte [ebx + 0x15]
    mov dword [ebx + 0xc], 0
    cmp dl, 0x69
    jb short local_085
    jbe near local_090
    cmp dl, 0x75
    jb short local_084
    jbe short local_086
    cmp dl, 0x78
local_083:
    je short local_086
    jmp near local_091
local_084:
    cmp dl, 0x6f
    jmp short local_083
local_085:
    cmp dl, 0x58
    jb short local_091
    jbe short local_086
    cmp dl, 0x64
    je short local_090
    jmp short local_091
local_086:
    mov dl, byte [esi + 0x14]
    and dl, 0x20
    and edx, 0xff
    je short local_087
    mov edx, dword [eax]
    add edx, 4
    mov dword [eax], edx
    mov ebp, dword [edx - 4]
    jmp short local_089
local_087:
    mov dl, byte [esi + 0x14]
    and dl, 0x10
    and edx, 0xff
    je short local_088
    mov ebp, dword [eax]
    add ebp, 4
    mov dword [eax], ebp
    movzx ebp, word [ebp - 4]
    jmp short local_089
local_088:
    mov ebx, dword [eax]
    add ebx, 4
    mov dword [eax], ebx
    mov ebp, dword [ebx - 4]
local_089:
    and byte [esi + 0x14], 0xf9
local_090:
    cmp dword [esi + 8], -1
    je short local_091
    mov byte [esi + 0x16], 0x20
local_091:
    mov dl, byte [esi + 0x15]
    mov ebx, 0xa
    cmp dl, 0x65
    jb short local_094
    jbe near local_100
    cmp dl, 0x6f
    jb short local_093
    jbe near local_101
    cmp dl, 0x73
    jb short local_092
    jbe near local_110
    cmp dl, 0x75
    jb near local_130
    jbe near local_123
    cmp dl, 0x78
    je near local_121
    jmp near local_130
local_092:
    cmp dl, 0x70
    je near local_124
    jmp near local_130
local_093:
    cmp dl, 0x67
    jb short local_099
    jbe near local_100
    cmp dl, 0x69
    je near local_106
    jmp near local_130
local_094:
    cmp dl, 0x50
    jb short local_096
    jbe near local_124
    cmp dl, 0x58
    jb short local_095
    jbe near local_121
    cmp dl, 0x63
    jb near local_130
    jbe near local_129
    jmp near local_106
local_095:
    cmp dl, 0x53
    je near local_110
    jmp near local_130
local_096:
    cmp dl, 0x46
    jb short local_098
    jbe short local_099
    cmp dl, 0x47
local_097:
    je short local_100
    jmp near local_130
local_098:
    cmp dl, 0x45
    jmp short local_097
local_099:
    mov dl, byte [esi + 0x14]
    and dl, 0x10
    and edx, 0xff
    je short local_100
    mov ebx, dword [eax]
    add ebx, 4
    mov dword [eax], ebx
    mov eax, edi
    mov edx, dword [ebx - 4]
    mov ebx, esi
    call local_064
    mov ebx, 0xffffffff
    mov eax, ds
    mov edx, ds
    mov es, eax
    mov eax, edi
    mov ecx, edi
    jmp short local_105
local_100:
    mov ebx, esi
    mov edx, eax
    mov eax, edi
    call local_081
    mov ebx, 0xffffffff
    mov es, edx
    mov ecx, eax
    jmp short local_105
local_101:
    mov al, byte [esi + 0x14]
    mov ebx, 8
    and al, 1
    and eax, 0xff
    je short local_102
    mov byte [edi], 0x30
    inc edi
local_102:
    mov edx, edi
    mov eax, ebp
    call LINK_ADDRESS_3
local_103:
    cmp dword [esi + 8], 0
    jne short local_104
    xor eax, eax
    mov al, byte [edi]
    cmp eax, 0x30
    jne short local_104
    mov byte es:[ecx], 0
local_104:
    mov ebx, 0xffffffff
    mov edx, es
    mov eax, ecx
local_105:
    call local_054
    jmp near local_131
local_106:
    mov dl, byte [esi + 0x14]
    and dl, 0x20
    and edx, 0xff
    je short local_108
    mov edx, dword [eax]
    add edx, 4
    mov dword [eax], edx
    mov eax, dword [edx - 4]
    mov edx, edi
local_107:
    call LINK_ADDRESS_3
    jmp short local_103
local_108:
    mov dl, byte [esi + 0x14]
    and dl, 0x10
    and edx, 0xff
    je short local_109
    mov ebp, dword [eax]
    add ebp, 4
    mov dword [eax], ebp
    mov edx, edi
    movsx eax, word [ebp - 4]
    jmp short local_107
local_109:
    mov edx, dword [eax]
    add edx, 4
    mov dword [eax], edx
    mov eax, dword [edx - 4]
    mov edx, edi
    call LINK_ADDRESS_1
    jmp short local_103
local_110:
    mov dl, byte [esi + 0x14]
    and dl, 0x80
    and edx, 0xff
    je short local_113
    mov edi, dword [eax]
    add edi, 8
    mov dword [eax], edi
    mov ecx, dword [edi - 8]
    mov dx, word [edi - 4]
    test ecx, ecx
    jne short local_111
    test dx, dx
    je short local_112
local_111:
    mov es, edx
    jmp short local_117
local_112:
    mov eax, ds
    mov ecx, dword [esp + 4]
    jmp short local_116
local_113:
    mov dl, byte [esi + 0x14]
    and dl, 0x40
    and edx, 0xff
    je short local_115
    mov ecx, dword [eax]
    add ecx, 4
    mov dword [eax], ecx
    mov ecx, dword [ecx - 4]
    test ecx, ecx
    je short local_112
local_114:
    mov eax, ds
    jmp short local_116
local_115:
    mov ebx, dword [eax]
    add ebx, 4
    mov dword [eax], ebx
    mov ecx, dword [ebx - 4]
    test ecx, ecx
    jne short local_114
    mov eax, ds
    mov ecx, dword [esp + 4]
local_116:
    mov es, eax
local_117:
    mov bl, byte [esi + 0x14]
    xor ebp, ebp
    xor eax, eax
    and bl, 0xf9
    mov dword [esp], ebp
    mov al, byte [esi + 0x15]
    mov byte [esi + 0x14], bl
    cmp eax, 0x53
    jne short local_119
    mov al, bl
    and al, 0x20
    and eax, 0xff
    je short local_118
    xor eax, eax
    db 0x66, 0x26, 0x8b, 0x01    ; mov ax, word es:[ecx]
    add ecx, 2
    jmp near local_131
local_118:
    mov al, byte es:[ecx]
    inc ecx
    jmp near local_131
local_119:
    mov al, bl
    and al, 0x20
    and eax, 0xff
    je short local_120
    mov edx, es
    mov eax, ecx
    mov ebx, dword [esi + 8]
    call local_057
    jmp near local_131
local_120:
    mov edx, es
    mov eax, ecx
    mov ebx, dword [esi + 8]
    jmp near local_105
local_121:
    mov al, byte [esi + 0x14]
    and al, 1
    and eax, 0xff
    je short local_122
    test ebp, ebp
    je short local_122
    mov byte [esi + 0x17], 0x30
    mov al, byte [esi + 0x15]
    mov byte [esi + 0x19], 0
    mov byte [esi + 0x18], al
local_122:
    mov ebx, 0x10
local_123:
    mov edx, edi
    mov eax, ebp
    call LINK_ADDRESS_4
    xor eax, eax
    mov al, byte [esi + 0x15]
    cmp eax, 0x58
    jne near local_103
    mov eax, edi
    call local_141
    jmp near local_103
local_124:
    cmp dword [esi + 4], 0
    jne short local_126
    mov dl, byte [esi + 0x14]
    and dl, 0x80
    and edx, 0xff
    je short local_125
    mov dword [esi + 4], 0xd
    jmp short local_126
local_125:
    mov dword [esi + 4], 8
local_126:
    and byte [esi + 0x14], 0xf9
    mov ebx, dword [eax]
    add ebx, 4
    mov dword [eax], ebx
    mov dl, byte [esi + 0x14]
    and dl, 0x80
    mov byte [esp + 8], dl
    xor edx, edx
    mov dl, byte [esp + 8]
    mov ebp, dword [ebx - 4]
    test edx, edx
    je short local_127
    add ebx, 4
    mov dword [eax], ebx
    mov edx, edi
    mov eax, dword [ebx - 4]
    mov ebx, 4
    and eax, 0xffff
    call local_059
    mov ebx, 8
    lea edx, [edi + 5]
    mov eax, ebp
    mov byte [edi + 4], 0x3a
    jmp short local_128
local_127:
    mov ebx, 8
    mov edx, edi
    mov eax, ebp
local_128:
    call local_059
    xor eax, eax
    mov al, byte [esi + 0x15]
    cmp eax, 0x50
    jne near local_104
    mov eax, edi
    call local_141
    jmp near local_104
local_129:
    mov ebp, dword [eax]
    add ebp, 4
    mov dword [eax], ebp
    mov al, byte [ebp - 4]
    mov byte [edi + 1], 0
    mov byte [edi], al
    mov dword [esi + 8], 1
    mov dh, byte [esi + 0x14]
    xor eax, eax
    and dh, 0xf9
    mov dword [esp], eax
    mov eax, 1
    mov byte [esi + 0x14], dh
    jmp short local_131
local_130:
    mov dword [esi + 4], 0
    mov al, byte [esi + 0x15]
    mov byte [edi + 1], 0
    mov byte [edi], al
    mov dword [esi + 8], 1
    mov al, byte [esi + 0x14]
    xor edi, edi
    and al, 0xf9
    mov dword [esp], edi
    mov byte [esi + 0x14], al
    mov eax, 1
local_131:
    cmp dword [esp], 0
    je short local_137
    xor edx, edx
    mov dl, byte es:[ecx]
    cmp edx, 0x2d
    jne short local_132
    inc ecx
    mov byte [esi + 0x17], 0x2d
    dec eax
    jmp short local_134
local_132:
    mov dl, byte [esi + 0x14]
    and dl, 2
    and edx, 0xff
    je short local_133
    mov byte [esi + 0x17], 0x20
    jmp short local_134
local_133:
    mov dl, byte [esi + 0x14]
    and dl, 4
    and edx, 0xff
    je short local_135
    mov byte [esi + 0x17], 0x2b
local_134:
    mov byte [esi + 0x18], 0
local_135:
    mov edx, dword [esi + 8]
    cmp eax, edx
    jle short local_136
    mov dword [esi + 8], eax
    jmp short local_137
local_136:
    mov ebx, edx
    sub ebx, eax
    mov dword [esi + 0xc], ebx
local_137:
    xor edx, edx
    mov dl, byte [esi + 0x16]
    cmp edx, 0x2a
    jne short local_138
    mov dl, byte [esi + 0x14]
    mov byte [esi + 0x17], 0
    and dl, 0xf9
    mov byte [esi + 0x14], dl
local_138:
    mov ebx, dword [esi + 8]
    cmp ebx, -1
    je short local_139
    cmp eax, ebx
    jge short local_140
local_139:
    xor edx, edx
    mov dl, byte [esi + 0x15]
    cmp edx, 0x63
    je short local_140
    mov dword [esi + 8], eax
local_140:
    mov ebx, 0xffffffff
    lea eax, [esi + 0x17]
    mov edx, ds
    call local_054
    mov ebp, dword [esi + 8]
    mov edx, dword [esi + 0xc]
    add eax, ebp
    mov ebx, dword [esi + 4]
    add eax, edx
    mov edx, es
    sub ebx, eax
    mov eax, ecx
    mov dword [esi + 4], ebx
    add esp, 0xc
    pop ebp
    pop es
    pop edi
    pop esi
    ret
local_141:
    push edx
    mov edx, eax
local_142:
    cmp byte [edx], 0
    je short local_143
    xor eax, eax
    mov al, byte [edx]
    call LINK_ADDRESS_5
    mov byte [edx], al
    inc edx
    jmp short local_142
local_143:
    pop edx
    ret
