bits 32
org START_ADDRESS

    db 0x00
    push esi
    push edi
    push ecx
    push ds
    mov ds, edx
    or eax, eax
    je short local_001
    add eax, 0xb
    jb short local_001
    and al, 0xf8
    mov edx, 0x10
    sub eax, edx
    cmc
    sbb ecx, ecx
    and eax, ecx
    add eax, edx
    cmp eax, dword [ebx + 0x14]
    ja short local_001
    mov esi, dword [ebx + 0xc]
    mov edi, dword [ebx + 0x10]
    cmp eax, edi
    ja short local_000
    mov esi, dword [ebx + 0x28]
    sub edi, edi
local_000:
    mov edx, dword [esi]
    cmp eax, edx
    jbe short local_002
    sub edi, edx
    cmc
    sbb ecx, ecx
    and edi, ecx
    add edi, edx
    lea edx, [ebx + 0x20]
    mov esi, dword [esi + 8]
    cmp esi, edx
    jne short local_000
    mov dword [ebx + 0x14], edi
local_001:
    sub eax, eax
    jmp short local_005
local_002:
    sub edx, eax
    mov dword [ebx + 0x10], edi
    inc dword [ebx + 0x18]
    mov ecx, dword [esi + 8]
    cmp edx, 0x10
    jb short local_003
    mov edi, esi
    add edi, eax
    mov dword [ebx + 0xc], edi
    mov dword [edi], edx
    mov dword [esi], eax
    mov ebx, dword [esi + 4]
    mov dword [edi + 4], ebx
    mov dword [edi + 8], ecx
    mov dword [ebx + 8], edi
    mov ebx, ecx
    mov dword [ebx + 4], edi
    jmp short local_004
local_003:
    dec dword [ebx + 0x1c]
    mov eax, esi
    mov edi, ecx
    mov esi, dword [esi + 4]
    mov dword [esi + 8], edi
    mov dword [edi + 4], esi
    mov dword [ebx + 0xc], esi
    mov esi, eax
local_004:
    or dword [esi], 1
    mov eax, esi
    add eax, 4
local_005:
    pop ds
    pop ecx
    pop edi
    pop esi
    ret
local_006:
    jmp near local_020
    push esi
    push edi
    push ecx
    push ds
    mov ds, edx
    or eax, eax
    je short local_006
    mov esi, eax
    sub esi, 4
    mov eax, dword [esi]
    test al, 1
    je short local_006
    and al, 0xfe
    mov edi, esi
    add edi, eax
    test dword [edi], 1
    jne short local_008
    cmp edi, dword [ebx + 0xc]
    jne short local_007
    mov dword [ebx + 0xc], esi
local_007:
    add eax, dword [edi]
    mov dword [esi], eax
    push ebx
    mov ebx, dword [edi + 4]
    mov edi, dword [edi + 8]
    mov dword [ebx + 8], edi
    mov dword [edi + 4], ebx
    pop ebx
    dec dword [ebx + 0x1c]
    jmp short local_015
local_008:
    mov dword [esi], eax
    mov edi, dword [ebx + 0xc]
    cmp esi, edi
    jae short local_009
    cmp esi, dword [edi + 4]
    ja short local_015
    mov edi, dword [ebx + 0x28]
    cmp esi, edi
    jb short local_015
    jmp short local_010
local_009:
    mov edi, dword [edi + 8]
    cmp esi, edi
    jb short local_015
    lea edi, [ebx + 0x20]
    cmp esi, dword [ebx + 0x24]
    ja short local_015
local_010:
    sub edx, edx
    mov eax, dword [ebx + 0x18]
    mov ecx, dword [ebx + 0x1c]
    inc ecx
    div ecx
    dec ecx
    cmp eax, ecx
    jae short local_013
    mov edx, dword [ebx + 0x18]
    sub edx, ecx
    add eax, eax
    cmp edx, ecx
    ja short local_011
    sub eax, eax
local_011:
    mov edi, esi
    add edi, dword [esi]
local_012:
    mov edx, dword [edi]
    test dl, 1
    je short local_015
    cmp edx, -1
    je short local_013
    and dl, 0xfe
    add edi, edx
    dec eax
    jne short local_012
local_013:
    mov edi, dword [ebx + 0xc]
    cmp esi, edi
    jae short local_014
    mov edi, dword [ebx + 0x28]
local_014:
    cmp esi, edi
    jb short local_015
    mov edi, dword [edi + 8]
    cmp esi, edi
    jb short local_015
    mov edi, dword [edi + 8]
    cmp esi, edi
    jb short local_015
    mov edi, dword [edi + 8]
    jmp short local_014
local_015:
    mov edx, dword [edi + 4]
    mov ecx, dword [esi]
    db 0x87, 0xfa    ; xchg edx, edi
    mov eax, edi
    add eax, dword [edi]
    cmp eax, esi
    jne short local_017
    add ecx, dword [edi]
    mov dword [edi], ecx
    cmp esi, dword [ebx + 0xc]
    jne short local_016
    mov dword [ebx + 0xc], edi
local_016:
    mov esi, edi
    jmp short local_018
local_017:
    inc dword [ebx + 0x1c]
    mov dword [esi + 8], edx
    mov dword [esi + 4], edi
    mov dword [edi + 8], esi
    mov edi, edx
    mov dword [edi + 4], esi
local_018:
    dec dword [ebx + 0x18]
    cmp esi, dword [ebx + 0xc]
    jae short local_019
    cmp ecx, dword [ebx + 0x10]
    jbe short local_019
    mov dword [ebx + 0x10], ecx
local_019:
    cmp ecx, dword [ebx + 0x14]
    jbe short local_020
    mov dword [ebx + 0x14], ecx
local_020:
    pop ds
    pop ecx
    pop edi
    pop esi
    ret
local_021:
    push ecx
    push edx
    push esi
    mov edx, dword [LINK_ADDRESS_1]
    cmp eax, edx
    jne short local_022
    mov edx, dword [edx + 8]
    mov dword [LINK_ADDRESS_1], edx
local_022:
    cmp eax, dword [LINK_ADDRESS_2]
    jne short local_023
    xor ecx, ecx
    mov dword [LINK_ADDRESS_2], ecx
local_023:
    mov esi, dword [LINK_ADDRESS_3]
    cmp eax, esi
    jne short local_024
    mov edx, dword [esi + 8]
    mov dword [LINK_ADDRESS_3], edx
local_024:
    mov edx, dword [eax + 4]
    mov eax, dword [eax + 8]
    test edx, edx
    je short local_025
    mov dword [edx + 8], eax
local_025:
    test eax, eax
    je short local_026
    mov dword [eax + 4], edx
local_026:
    pop esi
    pop edx
    pop ecx
    ret
local_027:
    push ebx
    push ecx
    push edx
    push esi
    push edi
    mov edx, dword [LINK_ADDRESS_3]
local_028:
    test edx, edx
    je near local_055
    mov eax, dword [edx + 0x24]
    mov eax, dword [eax]
    mov ebx, dword [edx]
    add eax, 0x2c
    cmp eax, ebx
    jne short local_030
    lea ebx, [edx - 8]
    mov eax, edx
    mov ecx, dword [edx + 8]
    call local_021
    mov edx, ecx
    mov ecx, dword [ebx + 4]
    test ecx, ecx
    jne short local_029
    mov esi, dword [ebx]
    mov di, word [ebx]
    shr esi, 0x10
    mov ah, 5
    mov al, 2
    int 0x31
    jmp short local_028
local_029:
    mov eax, ecx
    push es
    mov es, eax
    mov ah, 0x49
    int 0x21
    rcl eax, 1
    ror eax, 1
    pop es
    jmp short local_028
local_030:
    mov edx, dword [edx + 8]
    jmp short local_028
    push ebx
    push ecx
    push esi
    push edi
    push ebp
    mov ebx, eax
    mov ebp, edx
    call local_027
    mov edx, dword [LINK_ADDRESS_3]
    jmp near local_036
local_031:
    cmp edx, ebx
    ja near local_037
    lea eax, [edx + 0x2c]
    cmp eax, ebx
    jne near local_035
    cmp dword [edx + 0x18], 1
    jne near local_035
    mov eax, edx
    call local_021
    lea eax, [edx - 8]
    cmp dword [eax + 4], 0
    jne near local_037
    mov ecx, ebp
    mov ebx, dword [ebx]
    mov edx, dword [edx]
    sub ebx, 4
    add edx, 0xc
    sub ecx, ebx
    add edx, ecx
    add edx, 0xfff
    xor dl, dl
    and dh, 0xf0
    mov ebx, edx
    mov ecx, edx
    shr ebx, 0x10
    mov di, word [eax]
    mov si, word [eax + 2]
    mov ah, 5
    mov al, 3
    int 0x31
    sbb eax, eax
    inc eax
    je short local_032
    mov ax, bx
    shl eax, 0x10
    mov ax, cx
    mov word [eax], di
    mov word [eax + 2], si
local_032:
    test eax, eax
    je short local_038
    lea ebx, [eax + 8]
    sub edx, 0xc
    inc ebp
    mov dword [eax + 4], 0
    mov eax, ebx
    mov dword [ebx], edx
    call local_039
    mov dword [ebx + 0x18], 1
    and ebp, 0xfffffffe
    mov edx, dword [eax]
    sub edx, ebp
    mov ecx, eax
    cmp edx, 0xc
    jb short local_033
    mov esi, ebp
    or si, 1
    mov dword [eax], esi
    add eax, ebp
    or dl, 1
    mov dword [eax], edx
    mov edi, dword [ebx + 0x18]
    mov dword [ebx + 0x14], 0xffffffff
    inc edi
    add eax, 4
    mov dword [ebx + 0x18], edi
    call LINK_ADDRESS_4
    jmp short local_034
local_033:
    or byte [eax], 1
local_034:
    mov eax, ecx
    jmp short local_038
local_035:
    mov edx, dword [edx + 8]
local_036:
    test edx, edx
    jne near local_031
local_037:
    xor eax, eax
local_038:
    pop ebp
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
local_039:
    push ebx
    push edx
    mov edx, eax
    mov eax, dword [LINK_ADDRESS_3]
    xor ebx, ebx
    jmp short local_041
local_040:
    cmp edx, eax
    jb short local_042
    mov ebx, eax
    mov eax, dword [eax + 8]
local_041:
    test eax, eax
    jne short local_040
local_042:
    mov dword [edx + 4], ebx
    mov dword [edx + 8], eax
    test ebx, ebx
    je short local_043
    mov dword [ebx + 8], edx
    jmp short local_044
local_043:
    mov dword [LINK_ADDRESS_3], edx
local_044:
    test eax, eax
    je short local_045
    mov dword [eax + 4], edx
local_045:
    lea ebx, [edx + 0x20]
    mov eax, dword [edx]
    add edx, 0x2c
    mov dword [edx - 0xc], 0
    mov dword [edx - 0x1c], 0
    mov dword [edx - 0x14], 0
    mov dword [edx - 0x10], 0
    mov dword [edx - 8], ebx
    mov dword [edx - 4], ebx
    sub eax, 0x2c
    mov dword [edx - 0x20], ebx
    mov dword [edx], eax
    mov dword [edx + eax], 0xffffffff
    mov eax, edx
    pop edx
    pop ebx
    ret
local_046:
    push ebx
    push edx
    mov edx, dword [LINK_ADDRESS_3]
    test edx, edx
    je short local_048
    mov edx, dword [edx + 0x24]
    mov eax, dword [edx]
    add eax, edx
    lea ebx, [eax + 4]
    xor eax, eax
    mov al, byte [LINK_ADDRESS_5]
    cmp eax, 2
    jl short local_047
    cmp eax, 8
    jg short local_047
    cmp byte [LINK_ADDRESS_6], 0
    jne short local_047
    xor eax, eax
    mov ax, ds
    lsl eax, eax
    inc eax
    mov dword [LINK_ADDRESS_7], eax
local_047:
    cmp ebx, dword [LINK_ADDRESS_7]
    jne short local_048
    mov eax, dword [edx]
    pop edx
    pop ebx
    ret
local_048:
    xor eax, eax
    pop edx
    pop ebx
    ret
local_049:
    push ebx
    push ecx
    push edx
    push esi
    push edi
    push eax
    mov ebx, dword [esp]
    mov ecx, dword [esp]
    shr ebx, 0x10
    call local_027
    mov ah, 5
    mov al, 1
    int 0x31
    sbb eax, eax
    inc eax
    je short local_050
    mov ax, bx
    shl eax, 0x10
    mov ax, cx
    mov word [eax], di
    mov word [eax + 2], si
local_050:
    test eax, eax
    je short local_051
    mov ebx, dword [esp]
    lea edx, [eax + 8]
    sub ebx, 8
    mov dword [edx], ebx
    mov dword [eax + 4], 0
    mov eax, edx
    jmp near local_054
local_051:
    test word [LINK_ADDRESS_8], 0xfff0
    je short local_052
    mov dword [LINK_ADDRESS_9], 0xfffff
local_052:
    cmp dword [esp], 0x10000
    ja short local_053
    mov ebx, dword [LINK_ADDRESS_9]
    shr ebx, 4
    or bl, 1
    mov ah, 0x48
    int 0x21
    rcl eax, 1
    ror eax, 1
    mov edx, eax
    test eax, eax
    jl short local_053
    mov ebx, dword [esp]
    shr ebx, 4
    mov ah, 0x48
    int 0x21
    rcl eax, 1
    ror eax, 1
    mov esi, eax
    mov ebx, eax
    mov eax, edx
    push es
    mov es, eax
    mov ah, 0x49
    int 0x21
    rcl eax, 1
    ror eax, 1
    pop es
    test esi, esi
    jl short local_053
    mov ah, 0
    mov al, 6
    int 0x31
    mov eax, ecx
    shl eax, 0x10
    mov ax, dx
    add eax, 8
    mov edx, dword [esp]
    mov dword [eax - 4], esi
    sub edx, 8
    mov dword [eax], edx
    jmp short local_054
local_053:
    xor eax, eax
local_054:
    add esp, 4
local_055:
    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
local_056:
    push ebx
    push ecx
    push edx
    push esi
    push edi
    push eax
    cmp dword [LINK_ADDRESS_10], 0
    jne short local_058
local_057:
    xor eax, eax
    jmp short local_054
local_058:
    cmp dword [LINK_ADDRESS_7], -2
    je short local_057
    mov eax, esp
    call local_075
    test eax, eax
    je short local_054
    xor eax, eax
    mov al, byte [LINK_ADDRESS_5]
    cmp eax, 1
    jne short local_059
    mov eax, dword [esp]
    call local_049
    mov edx, eax
    test eax, eax
    je short local_060
    mov eax, dword [eax]
    mov dword [esp], eax
    jmp short local_060
local_059:
    mov ebx, dword [esp]
    mov eax, 0x80004800
    int 0x21
    sbb ebx, ebx
    not ebx
    and eax, ebx
    mov ecx, dword [esp]
    sub ecx, 4
    mov edx, eax
    mov dword [esp], ecx
local_060:
    test edx, edx
    je short local_057
    mov eax, dword [esp]
    mov esi, dword [esp]
    sub eax, 4
    cmp eax, esi
    ja short local_057
    mov dword [esp], eax
    cmp eax, 0x38
    jb short local_057
    mov dword [edx], eax
    mov eax, edx
    call local_039
    mov ebx, eax
    mov eax, dword [eax]
    mov dword [esp], eax
    or al, 1
    mov dword [ebx], eax
    mov edi, dword [edx + 0x18]
    mov dword [edx + 0x14], 0xffffffff
    inc edi
    lea eax, [ebx + 4]
    mov dword [edx + 0x18], edi
    call LINK_ADDRESS_4
    mov eax, 1
    jmp near local_054
    push ebx
    push ecx
    push edx
    push esi
    push ebp
    push eax
    xor eax, eax
    mov al, byte [LINK_ADDRESS_5]
    cmp eax, 1
    jne short local_061
    cmp byte [LINK_ADDRESS_11], 0
    je short local_062
local_061:
    xor eax, eax
    mov al, byte [LINK_ADDRESS_5]
    cmp eax, 9
    jne short local_063
local_062:
    mov eax, dword [esp]
    call local_056
    jmp near local_074
local_063:
    cmp dword [LINK_ADDRESS_10], 0
    jne short local_065
local_064:
    xor eax, eax
    jmp near local_074
local_065:
    cmp dword [LINK_ADDRESS_7], -2
    je short local_064
    mov eax, esp
    call local_075
    test eax, eax
    je near local_074
    xor eax, eax
    mov al, byte [LINK_ADDRESS_5]
    cmp eax, 2
    jl short local_066
    cmp eax, 8
    jg short local_066
    cmp byte [LINK_ADDRESS_6], 0
    jne short local_066
    xor eax, eax
    mov ax, ds
    lsl eax, eax
    inc eax
    mov dword [LINK_ADDRESS_7], eax
local_066:
    mov edx, dword [esp]
    mov ecx, dword [LINK_ADDRESS_7]
    add edx, ecx
    cmp edx, ecx
    jae short local_067
    mov edx, 0xfffffffe
local_067:
    mov eax, edx
    call LINK_ADDRESS_12
    cmp eax, -1
    je short local_064
    mov ebx, eax
    cmp eax, -8
    ja short local_064
    cmp edx, eax
    jbe short local_064
    sub edx, eax
    mov dword [esp], edx
    lea eax, [edx - 4]
    cmp eax, edx
    ja short local_064
    mov edx, dword [LINK_ADDRESS_3]
    mov dword [esp], eax
    jmp short local_070
local_068:
    mov ebp, dword [edx + 8]
    test ebp, ebp
    je short local_071
    cmp edx, ebx
    ja short local_069
    cmp ebx, ebp
    jb short local_071
local_069:
    mov edx, dword [edx + 8]
local_070:
    test edx, edx
    jne short local_068
local_071:
    test edx, edx
    je short local_072
    mov eax, dword [edx]
    lea ecx, [ebx - 4]
    add eax, edx
    cmp ecx, eax
    jne short local_072
    mov esi, dword [esp]
    add esi, 4
    mov dword [esp], esi
    add dword [edx], esi
    mov ebp, dword [esp]
    mov ebx, eax
    lea ecx, [eax + ebp]
    mov dword [ecx], 0xffffffff
    jmp short local_073
local_072:
    cmp dword [esp], 0x38
    jb near local_064
    mov eax, dword [esp]
    mov dword [ebx], eax
    mov eax, ebx
    mov edx, ebx
    call local_039
    mov ebx, eax
    mov eax, dword [eax]
    mov dword [esp], eax
local_073:
    mov eax, dword [esp]
    or al, 1
    mov dword [ebx], eax
    inc dword [edx + 0x18]
    lea eax, [ebx + 4]
    mov dword [edx + 0x14], 0xffffffff
    call LINK_ADDRESS_4
    mov eax, 1
local_074:
    add esp, 4
    pop ebp
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret
local_075:
    push ebx
    push edx
    push esi
    mov ebx, eax
    mov edx, dword [eax]
    add edx, 0xb
    and dl, 0xf8
    test edx, edx
    jne short local_077
local_076:
    xor eax, eax
    pop esi
    pop edx
    pop ebx
    ret
local_077:
    xor eax, eax
    mov al, byte [LINK_ADDRESS_5]
    cmp eax, 1
    jne short local_078
    cmp byte [LINK_ADDRESS_11], 0
    je short local_079
local_078:
    xor eax, eax
    mov al, byte [LINK_ADDRESS_5]
    cmp eax, 9
    jne short local_080
local_079:
    add edx, 8
    jmp short local_081
local_080:
    call local_046
    sub edx, eax
local_081:
    mov dword [ebx], edx
    add edx, 0x3c
    cmp edx, dword [ebx]
    jb short local_076
    mov esi, dword [LINK_ADDRESS_13]
    cmp edx, esi
    jae short local_082
    mov edx, esi
    and dl, 0xfe
local_082:
    mov dword [ebx], edx
    add edx, 0xfff
    cmp edx, dword [ebx]
    jb short local_076
    xor dl, dl
    and dh, 0xf0
    mov dword [ebx], edx
    test edx, edx
    setne al
    and eax, 0xff
    pop esi
    pop edx
    pop ebx
    ret
    xor eax, eax
    ret
