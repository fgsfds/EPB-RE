bits 32

%define ticks_start_hi DATA_BASE
%define ticks_start_lo (DATA_BASE + 4)
%define ticks_elapsed_hi (DATA_BASE + 8)
%define ticks_elapsed_lo (DATA_BASE + 12)
%define fpu_control (DATA_BASE + FPU_OFFSET)
%define axis_count (fpu_control + 2)
%define axis_mask (axis_count + 16)

start_timer:
    push eax
    push edx
    xor eax, eax
    xor edx, edx
    rdtsc
    mov [ticks_start_hi], edx
    mov [ticks_start_lo], eax
    pop edx
    pop eax
    ret

stop_timer:
    push eax
    push edx
    xor eax, eax
    xor edx, edx
    rdtsc
    sub eax, [ticks_start_lo]
    sbb edx, [ticks_start_hi]
    mov [ticks_elapsed_hi], edx
    mov [ticks_elapsed_lo], eax
    pop edx
    pop eax
    ret

    times 0x40 - ($ - $$) db 0
set_extended_precision:
    fclex
    fstcw [fpu_control]
    and word [fpu_control], 0xfcff
    or word [fpu_control], 0x300
    fldcw [fpu_control]
    ret

set_single_precision:
    fclex
    fstcw [fpu_control]
    and word [fpu_control], 0xfcff
    fldcw [fpu_control]
    ret

    times 0x80 - ($ - $$) db 0
read_gameport_axes:
    pushfw
    push ebp
    xor eax, eax
    mov ah, [axis_mask]
    mov edx, 0x201
    xor ebx, ebx
    xor ecx, ecx
    xor esi, esi
    xor edi, edi
    xor ebp, ebp
    cli
    out dx, al
.poll:
    inc edi
    cmp edi, strict dword 5000
    je short .done
    in al, dx
    and al, ah
    test al, 1
    jz short .axis2
    inc ebx
.axis2:
    test al, 2
    jz short .axis3
    inc ecx
.axis3:
    test al, 4
    jz short .axis4
    inc ebp
.axis4:
    test al, 8
    jz short .again
    inc esi
.again:
    test al, 15
    jnz short .poll
.done:
    sti
    mov [axis_count], ebx
    mov [axis_count + 4], ecx
    mov [axis_count + 8], ebp
    mov [axis_count + 12], esi
    pop ebp
    popfw
    ret
