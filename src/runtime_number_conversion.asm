bits 32
org START_ADDRESS

    mov dword [LINK_ADDRESS_1], eax
    ret
local_000:
    push esi
    push edi
    push ebp
    sub esp, 4
    mov edi, eax
    mov esi, edx
    mov dword [esp], ecx
    mov eax, ebx
    test edx, edx
    jge short local_001
    mov cl, 0x2d
    neg esi
    jmp short local_002
local_001:
    mov cl, 0x2b
local_002:
    mov ebx, 0x64
    mov edx, 3
    cmp esi, ebx
    jge short local_003
    mov ebx, 0xa
    mov edx, 2
    cmp esi, ebx
    jge short local_003
    mov edx, 1
    mov ebx, edx
local_003:
    test eax, eax
    jne short local_004
    mov eax, 2
    cmp edx, 3
    jne short local_004
    mov eax, edx
local_004:
    lea ebp, [eax + 1]
    cmp ebp, dword [esp]
    jg short local_008
    cmp edx, eax
    jg short local_007
    mov byte [edi], cl
local_005:
    inc edi
    cmp eax, edx
    jle short local_006
    dec eax
    mov byte [edi], 0x30
    jmp short local_005
local_006:
    mov edx, esi
    mov eax, esi
    sar edx, 0x1f
    idiv ebx
    mov edx, esi
    add eax, 0x30
    sar edx, 0x1f
    mov byte [edi], al
    mov eax, esi
    idiv ebx
    mov esi, edx
    mov eax, ebx
    mov edx, ebx
    mov ebx, 0xa
    sar edx, 0x1f
    idiv ebx
    inc edi
    mov ebx, eax
    test eax, eax
    jne short local_006
    jmp short local_008
local_007:
    lea ebp, [edx + 1]
local_008:
    mov eax, ebp
    add esp, 4
    pop ebp
    pop edi
local_009:
    pop esi
    ret
local_010:
    push esi
    mov esi, ebx
    test ecx, ecx
    jne short local_011
    test ebx, ebx
    jg short local_011
    mov byte [eax], 0x30
    inc eax
    mov byte [eax], 0x2e
    inc eax
    pop esi
    ret
local_011:
    test esi, esi
    jle short local_012
    mov bl, byte [edx]
    test bl, bl
    je short local_012
    inc edx
    dec esi
    mov byte [eax], bl
    inc eax
    jmp short local_011
local_012:
    test esi, esi
    jle short local_014
local_013:
    dec esi
    mov byte [eax], 0x30
    inc eax
    test esi, esi
    jg short local_013
local_014:
    mov byte [eax], 0x2e
    inc eax
    test ecx, ecx
    jle short local_016
local_015:
    test esi, esi
    je short local_016
    inc esi
    mov byte [eax], 0x30
    inc eax
    dec ecx
    jne short local_015
local_016:
    test ecx, ecx
    jle short local_009
local_017:
    mov bh, byte [edx]
    test bh, bh
    je short local_018
    inc edx
    mov byte [eax], bh
    inc eax
    dec ecx
    jne short local_017
local_018:
    test ecx, ecx
    je short local_009
    dec ecx
    mov byte [eax], 0x30
    inc eax
    jmp short local_018
local_019:
    push ebp
    mov ebp, esp
    push ecx
    push esi
    push edi
    sub esp, 8
    mov edi, eax
    mov esi, edx
    cmp edx, ebx
    je short local_024
    mov dword [ebp - 0x14], edi
    mov al, byte [eax + 1]
    lea edx, [ebx + edi]
    mov byte [ebp - 0x10], al
    lea eax, [esi + edi]
local_020:
    dec eax
    dec edx
    mov cl, byte [eax]
    dec esi
    mov byte [edx], cl
    mov ecx, dword [ebp - 0x14]
    dec ebx
    cmp eax, ecx
    jne short local_020
    xor eax, ecx
    mov al, byte [edi]
    cmp eax, 0x2e
    jne short local_021
    dec ebx
    mov byte [edi + ebx], 0x30
    jmp short local_023
local_021:
    cmp eax, 0x2b
    je short local_022
    cmp eax, 0x2d
    jne short local_023
local_022:
    xor eax, eax
    mov al, byte [ebp - 0x10]
    cmp eax, 0x2e
    jne short local_023
    mov byte [edi + ebx], 0x30
    dec ebx
    mov dl, byte [edi]
    mov byte [edi + ebx], dl
local_023:
    mov edx, 0x20
    mov eax, edi
    call LINK_ADDRESS_2
local_024:
    lea esp, [ebp - 0xc]
    pop edi
    pop esi
    pop ecx
    pop ebp
    ret
    push ebp
    mov ebp, esp
    push esi
    push edi
    sub esp, 0x38
    mov edi, dword [ebp + 8]
    mov dword [ebp - 0xc], eax
    mov ch, cl
    lea eax, [ebp - 0x40]
    push eax
    mov esi, dword [edx + 4]
    push esi
    mov eax, dword [edx]
    push eax
    call LINK_ADDRESS_3
    test eax, eax
    je short local_028
    mov eax, dword [ebp - 0xc]
    xor esi, esi
    jmp short local_027
local_025:
    cmp esi, edi
    jge short local_026
    mov byte [eax], dh
local_026:
    inc eax
    inc esi
local_027:
    mov dh, byte [esi + ebp - 0x40]
    test dh, dh
    jne short local_025
    jmp near local_048
local_028:
    mov cl, byte [ebp + 0x18]
    mov al, cl
    cmp eax, 0x47
    jne near local_034
    fld qword [edx]
    fabs
    fstp qword [ebp - 0x2c]
    mov esi, dword [ebp - 0x28]
    mov eax, dword [ebp - 0x2c]
    test esi, 0x7fffffff
    jne short local_029
    test eax, eax
    je short local_033
local_029:
    fld qword [ebp - 0x2c]
    call LINK_ADDRESS_4
    fstp qword [ebp - 0x2c]
    mov eax, dword [ebp - 0x28]
    push eax
    mov esi, dword [ebp - 0x2c]
    push esi
    call LINK_ADDRESS_5
    call LINK_ADDRESS_6
    fistp dword [ebp - 0x14]
    mov eax, dword [ebp - 0x14]
    cmp eax, -4
    jl short local_030
    cmp ebx, eax
    jg short local_031
local_030:
    mov cl, 0x45
    jmp short local_034
local_031:
    fldz
    fcomp qword [ebp - 0x2c]
    fnstsw ax
    sahf
    ja short local_032
    inc dword [ebp - 0x14]
local_032:
    mov esi, dword [ebp - 0x14]
    sub ebx, esi
    test esi, esi
    jge short local_033
    dec ebx
local_033:
    xor esi, esi
    mov cl, 0x46
    mov dword [ebp + 0xc], esi
local_034:
    xor eax, eax
    mov al, cl
    cmp eax, 0x45
    jne short local_036
    mov eax, ebx
    mov esi, dword [ebp + 0xc]
    neg eax
    cmp eax, esi
    jge short local_035
    lea eax, [ebx + 2]
    cmp eax, esi
    jg short local_036
local_035:
    mov edx, 0x2a
    mov eax, dword [ebp - 0xc]
    mov ebx, edi
    call LINK_ADDRESS_2
    jmp near local_049
local_036:
    xor eax, eax
    mov al, byte [ebp + 0x18]
    mov esi, ebx
    cmp eax, 0x45
    jne short local_038
    mov eax, dword [ebp + 0xc]
    test eax, eax
    jle short local_037
    lea esi, [ebx + 1]
    jmp short local_038
local_037:
    jge short local_038
    lea esi, [eax + ebx]
local_038:
    mov eax, dword [edx]
    mov dword [ebp - 0x24], eax
    mov eax, dword [edx + 4]
    mov ebx, dword [ebp - 0x24]
    mov dword [ebp - 0x20], eax
    test eax, 0x7fffffff
    jne short local_039
    test ebx, ebx
    je short local_040
local_039:
    xor eax, eax
    mov al, cl
    cmp eax, 0x45
    je short local_040
    mov eax, dword [ebp + 0xc]
    test eax, eax
    je short local_040
    push eax
    mov ebx, dword [ebp - 0x20]
    push ebx
    mov eax, dword [ebp - 0x24]
    push eax
    call LINK_ADDRESS_7
    fstp qword [ebp - 0x24]
local_040:
    lea eax, [ebp - 0x40]
    push eax
    xor eax, eax
    mov al, cl
    push eax
    lea eax, [ebp - 0x18]
    push eax
    lea eax, [ebp - 0x1c]
    push eax
    push esi
    mov edx, dword [ebp - 0x20]
    push edx
    mov ebx, dword [ebp - 0x24]
    push ebx
    call LINK_ADDRESS_8
    mov eax, dword [ebp - 0xc]
    mov edx, dword [ebp - 0x18]
    mov dword [ebp - 0x10], eax
    inc eax
    test edx, edx
    je short local_041
    mov edx, dword [ebp - 0xc]
    mov dword [ebp - 0x10], eax
    mov byte [edx], 0x2d
    jmp short local_042
local_041:
    test ch, ch
    je short local_042
    mov edx, dword [ebp - 0xc]
    mov dword [ebp - 0x10], eax
    mov byte [edx], 0x2b
local_042:
    xor edx, edx
    mov dl, cl
    lea eax, [edi + 1]
    cmp edx, 0x45
    jne short local_046
    mov edx, dword [ebp + 0xc]
    mov ecx, esi
    sub ecx, edx
    cmp edi, ecx
    jl near local_047
    mov eax, dword [ebp - 0x10]
    mov ebx, edx
    lea edx, [ebp - 0x40]
    call local_010
    mov ebx, dword [ebp - 0xc]
    mov dl, byte [ebp + 0x14]
    mov esi, eax
    mov dword [ebp - 0x10], eax
    sub esi, ebx
    test dl, dl
    je short local_043
    cmp esi, edi
    jge short local_043
    mov byte [eax], dl
    inc eax
    inc esi
    mov dword [ebp - 0x10], eax
local_043:
    mov ecx, dword [ebp - 0x20]
    mov eax, dword [ebp - 0x24]
    test ecx, 0x7fffffff
    jne short local_044
    test eax, eax
    je short local_045
local_044:
    mov eax, dword [ebp + 0xc]
    sub dword [ebp - 0x1c], eax
local_045:
    mov ebx, dword [ebp + 0x10]
    mov edx, dword [ebp - 0x1c]
    mov ecx, edi
    mov eax, dword [ebp - 0x10]
    sub ecx, esi
    call local_000
    add esi, eax
    jmp short local_048
local_046:
    mov ebx, dword [ebp - 0x10]
    mov edx, dword [ebp - 0x1c]
    mov ecx, dword [ebp - 0xc]
    inc edx
    sub ebx, ecx
    add edx, esi
    add edx, ebx
    cmp edi, edx
    jl short local_047
    mov ebx, dword [ebp - 0x1c]
    lea edx, [ebp - 0x40]
    mov eax, dword [ebp - 0x10]
    mov ecx, esi
    mov esi, dword [ebp - 0xc]
    call local_010
    sub eax, esi
local_047:
    mov esi, eax
local_048:
    cmp esi, edi
    jg near local_035
    mov eax, dword [ebp - 0xc]
    mov ebx, edi
    mov edx, esi
    call local_019
local_049:
    lea esp, [ebp - 8]
    pop edi
    pop esi
    pop ebp
    ret 0x14
