; String output callback, sprintf, and signed absolute value.
bits 32
org START_ADDRESS

put_string_byte:
    push ebx
    push ecx
    mov ebx, edx
    mov edx, dword [eax]
    lea ecx, [edx + 1]
    mov dword [eax], ecx
    mov byte [edx], bl
    inc dword [eax + 0x10]
    pop ecx
    pop ebx
    ret
sprintf:
    push ebx
    push ecx
    push edx
    sub esp, 4
    lea eax, [esp + 0x1c]
    mov ecx, LINK_ADDRESS_1
    mov ebx, esp
    mov edx, dword [esp + 0x18]
    mov dword [esp], eax
    mov eax, dword [esp + 0x14]
    call LINK_ADDRESS_2
    mov edx, dword [esp + 0x14]
    mov byte [edx + eax], 0
    add esp, 4
    pop edx
    pop ecx
    pop ebx
    ret
signed_absolute:
    test eax, eax
    jge short local_049
    neg eax
local_049:
    ret
