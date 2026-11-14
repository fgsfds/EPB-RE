; Game command actions and display feedback.
bits 32
org START_ADDRESS

%if GAME_UPDATE
    db 0x8d, 0x80, 0x00, 0x00, 0x00, 0x00    ; lea eax, [eax]
    db 0x8b, 0xd2    ; mov edx, edx
    push ebx
    push ecx
    push esi
    push edi
    push ebp
    mov ebx, eax
    mov ecx, 1
    mov eax, 3
    mov dword [0x125d4f], ecx
    int 0x10
    mov eax, 0xb5c
    mov dword [0x1261df], ecx
    call 0x77abc
    mov eax, ebx
    call 0x21230
    call 0x978dc
    mov dl, byte [0x7fda]
    mov dword [0x8dd0], eax
    test dl, dl
    jne short loc_0093
    cmp eax, 0x2ae860
    jge short loc_00a1
    mov eax, 0xb68
    call 0x9ffa7
    mov eax, 0xba0
    call 0x9ffa7
    mov eax, 0xbdc
    call 0x9ffa7
    mov eax, 0x2ae860
    sub eax, dword [0x8dd0]
    push eax
    push 0xbf8
    call 0x9fc44
    add esp, 8
    xor eax, eax
    call 0x9fe2e
    jmp short loc_00a1
loc_0093:
    push eax
    push 0xc28
    call 0x9fc44
    add esp, 8
loc_00a1:
    mov eax, 0x11a30
    call 0x98f64
    call 0x21b70
    mov eax, dword [0x2e44c]
    cmp eax, 4
    ja short loc_00f2
    jmp dword cs:[eax*4 + 0x120e4]
    mov dword [0x2e9ac], 0xc44
    jmp short loc_00fc
    mov dword [0x2e9ac], 0xc50
    jmp short loc_00fc
    mov dword [0x2e9ac], 0xc5c
    jmp short loc_00fc
    mov dword [0x2e9ac], 0xc74
    jmp short loc_00fc
loc_00f2:
    mov dword [0x2e9ac], 0xc68
loc_00fc:
    cmp byte [0x7e7c], 0
    je short loc_016e
    cmp word [0x2f2924], 1
    jle short loc_016e
    cmp dword [0x1b8ce4], 0xd
    je short loc_016e
    mov eax, 0xc80
    call 0x9ffa7
    mov eax, 0xccc
    call 0x9ffa7
    mov eax, 0xcec
    call 0x9ffa7
    mov eax, 0xd38
    call 0x9ffa7
    mov eax, 0xd84
    call 0x9ffa7
    mov eax, 0xdd0
    call 0x9ffa7
    mov eax, 0xe08
    call 0x9ffa7
loc_015e:
    call 0x9c39c
    test eax, eax
    jne short loc_016e
    call 0x10800
    jmp short loc_015e
loc_016e:
    mov bx, word [0x2f2924]
    cmp bx, 1
    jle short loc_018a
    movsx eax, bx
    mov dword [0x1261df], eax
    call 0x78c62
    jmp short loc_01ad
loc_018a:
    cmp byte [0x7f08], 0
    je short loc_01ad
    mov ebp, 7
    mov bh, 1
    xor eax, eax
    mov dword [0x1261d7], ebp
    mov dword [0x1261db], eax
    mov byte [0x12577d], bh
loc_01ad:
    cmp dword [0x1261df], 1
    jle short loc_01dd
    mov al, byte [0x1261df]
    mov cl, byte [0x12577d]
    mov byte [0x2e9c6], al
    test cl, cl
    jne short loc_01dd
    mov ebx, 1
    xor ecx, ecx
    mov dword [0x1261c3], ebx
    mov dword [0x1261d3], ecx
loc_01dd:
    mov ecx, 0xffffffff
    mov esi, dword [0x14074]
    mov word [0x125cfb], cx
    test esi, esi
    je short loc_0211
    push 0x172e0
    mov ecx, 0x172d0
    mov ebx, 0x172c0
    mov edx, 0x172b0
    mov eax, 0x172a0
    call 0x9d080
loc_0211:
    mov ebx, dword [0x1b8c94]
    mov edx, dword [0x1b8cb8]
    mov eax, dword [0x1b8ca0]
    call 0x60dc8
    test eax, eax
    jge short loc_0269
    mov edi, dword [0x2d6bc4]
    push edi
    mov ebp, dword [0x2d6bc8]
    push ebp
    push 0xe54
    mov ch, 2
    call 0x9fc44
    mov eax, 2
    mov ebx, dword [0x1b8c94]
    mov edx, dword [0x1b8cb8]
    add esp, 0xc
    mov byte [0x2d7ca0], ch
    mov dword [0x1b8ca0], eax
    call 0x60dc8
loc_0269:
    movsx edx, word [0x2f2926]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    db 0x8b, 0x14, 0x45, 0x05, 0x1b, 0x0f, 0x00    ; mov edx, dword [eax*2 + 0xf1b05]
    mov eax, dword [0x1261af]
    sar eax, 2
    call 0x713da
    cmp byte [0x353a91], 0
    je short loc_02a7
    mov eax, 0xf8
    call 0x15ff0
loc_02a7:
    call 0x91f54
    call 0x58740
    cmp byte [0x12577d], 1
    jbe near loc_036d
    cmp dword [0x1261df], 2
    jge near loc_036d
    xor eax, eax
    call 0x73c55
    movsx edx, word [0x2f2926]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    mov ebx, 0x251fb4
    sub eax, edx
    xor ecx, ecx
    xor edx, edx
    db 0x89, 0x1c, 0x45, 0x05, 0x1b, 0x0f, 0x00    ; mov dword [eax*2 + 0xf1b05], ebx
    xor ebx, ebx
    xor eax, eax
    call 0x43a50
    mov eax, dword [0x2d6bc4]
    dec eax
    push eax
    mov eax, dword [0x2d6bc8]
    dec eax
    push eax
    push 0
    push 0
    push 0x4a
    push 0
    push 0
    mov ebx, 0x10000
    mov edx, 0x640000
    push 0xcd1
    xor ecx, ecx
    mov eax, 0xa00000
    call 0x6eb5e
    push 0xe8c
    mov edx, 0x69
    mov eax, 0xa0
    xor ecx, ecx
    xor ebx, ebx
    call 0x3e980
    call 0x61a10
    mov al, byte [0x12577d]
    sub al, 2
    movsx eax, al
    call 0x3c8f0
    test eax, eax
    je short loc_036d
    xor dl, dl
    mov byte [0x12577d], dl
loc_036d:
    call 0x10800
loc_0372:
    cmp byte [0x12577d], 1
    jne short loc_03a3
    xor ebx, ebx
    xor edx, edx
    xor eax, eax
    mov bl, byte [0x1261d3]
    mov dl, byte [0x1261d7]
    mov al, byte [0x1261db]
    call 0x4f2e0
    mov eax, 4
    call 0x50120
    jmp short loc_03a8
loc_03a3:
    call 0x4dd90
loc_03a8:
    mov bl, byte [0x12577d]
    mov edx, dword [0x125d37]
    test bl, bl
    jne short loc_03d5
    call 0x22e00
    test eax, eax
    je short loc_03d5
    call 0x91f54
    mov cl, 1
    call 0x58740
    mov byte [0x2e9c5], cl
    jmp short loc_0372
loc_03d5:
    xor bh, bh
    mov dword [0x125d37], edx
    mov byte [0x12577d], bh
loc_03e3:
    movsx ebx, word [0x2f2926]
    mov eax, ebx
    shl eax, 7
    sub eax, ebx
    lea eax, [eax*4]
    sub eax, ebx
    add eax, eax
    test byte [eax + 0xf1ac2], 0x80
    jne near loc_0696
    cmp dword [0x1261a7], 2
    je short loc_0430
    cmp dword [0x1261df], 1
    jg short loc_0430
    cmp byte [0x125781], 0
    jne short loc_045a
    mov al, byte [eax + 0xf1ac2]
    and al, 1
    cmp al, 1
    je short loc_045a
loc_0430:
    movsx ebx, word [0x2f2926]
    mov eax, ebx
    shl eax, 7
    sub eax, ebx
    lea eax, [eax*4]
    sub eax, ebx
    db 0xf6, 0x04, 0x45, 0xc2, 0x1a, 0x0f, 0x00, 0x04    ; test byte [eax*2 + 0xf1ac2], 4
    je short loc_045a
    call 0x23380
    test al, al
    jne short loc_03e3
loc_045a:
    movsx ebx, word [0x2f2926]
    mov eax, ebx
    shl eax, 7
    sub eax, ebx
    lea eax, [eax*4]
    sub eax, ebx
    add eax, eax
    mov bl, byte [eax + 0xf1ac2]
    test bl, 8
    jne short loc_0487
    test bl, 0x20
    je near loc_0595
loc_0487:
    movsx ebx, word [0x2f2926]
    mov eax, ebx
    shl eax, 7
    sub eax, ebx
    lea eax, [eax*4]
    sub eax, ebx
    db 0xf6, 0x04, 0x45, 0xc2, 0x1a, 0x0f, 0x00, 0x08    ; test byte [eax*2 + 0xf1ac2], 8
    je near loc_0535
    call 0x22d70
    xor bh, bh
    xor edi, edi
    mov byte [0x12623a], bh
    mov ebx, dword [0x125d4b]
    mov dword [0x125d4b], edi
    call 0x4dd90
    xor eax, eax
    mov dword [0x125d4b], ebx
    call 0x24ef0
    cmp byte [0x12577f], 0
    je short loc_0535
    xor ch, ch
    mov ebp, dword [0x1261df]
    mov byte [0x12577f], ch
    cmp ebp, 2
    jge short loc_0529
    movsx edx, word [0x2f2926]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    db 0xc6, 0x04, 0x45, 0xc2, 0x1a, 0x0f, 0x00, 0x01    ; mov byte [eax*2 + 0xf1ac2], 1
    xor eax, eax
    xor edi, edi
    call 0x3c5f0
    mov word [0x9040], di
    jmp near loc_0372
loc_0529:
    mov dword [0x1261d7], edi
    mov dword [0x1261e7], edi
loc_0535:
    xor al, al
    mov si, word [0x2f2924]
    mov byte [0x12623a], al
    cmp si, 1
    jle short loc_0568
    movsx ebx, word [0x2f2926]
    mov eax, ebx
    shl eax, 7
    sub eax, ebx
    lea eax, [eax*4]
    sub eax, ebx
    db 0xc6, 0x04, 0x45, 0xc2, 0x1a, 0x0f, 0x00, 0x04    ; mov byte [eax*2 + 0xf1ac2], 4
loc_0568:
    movsx ebx, word [0x2f2926]
    mov eax, ebx
    shl eax, 7
    sub eax, ebx
    lea eax, [eax*4]
    sub eax, ebx
    db 0x8a, 0x04, 0x45, 0xc2, 0x1a, 0x0f, 0x00    ; mov al, byte [eax*2 + 0xf1ac2]
    and eax, 0xff
    call 0x50120
    jmp near loc_03e3
loc_0595:
    call 0x1f6a0
    call 0x20770
    cmp byte [0x125781], 0
    jne short loc_05d2
    cmp dword [0x1261df], 2
    jge short loc_05d2
    movsx ebx, word [0x2f2926]
    mov eax, ebx
    shl eax, 7
    sub eax, ebx
    lea eax, [eax*4]
    sub eax, ebx
    db 0xf6, 0x04, 0x45, 0xc2, 0x1a, 0x0f, 0x00, 0x01    ; test byte [eax*2 + 0xf1ac2], 1
    je short loc_05e4
loc_05d2:
    cmp dword [0x1261df], 1
    jg short loc_05e4
    cmp dword [0x1261a7], 2
    jne short loc_063a
loc_05e4:
    mov eax, dword [0x2d6bbc]
    mov edx, dword [0x121eac]
    sub eax, edx
    shl eax, 0xe
    test eax, eax
    jle short loc_0604
    mov eax, dword [0x2d6bbc]
    sub eax, edx
    shl eax, 0xe
    jmp short loc_0606
loc_0604:
    xor eax, eax
loc_0606:
    cmp eax, 0x10000
    jge short loc_0631
    mov eax, dword [0x2d6bbc]
    mov ecx, dword [0x121eac]
    sub eax, ecx
    shl eax, 0xe
    test eax, eax
    jle short loc_062d
    mov eax, dword [0x2d6bbc]
    sub eax, ecx
    shl eax, 0xe
    jmp short loc_0636
loc_062d:
    xor eax, eax
    jmp short loc_0636
loc_0631:
    mov eax, 0x10000
loc_0636:
    mov ebx, eax
    jmp short loc_063f
loc_063a:
    mov ebx, 0x10000
loc_063f:
    movsx eax, word [0x1256c6]
    mov edx, ebx
    call 0x18710
    mov eax, ebx
    call 0x175b0
    movsx ebx, word [0x2f2926]
    mov eax, ebx
    shl eax, 7
    sub eax, ebx
    lea eax, [eax*4]
    sub eax, ebx
    db 0xf6, 0x04, 0x45, 0xc2, 0x1a, 0x0f, 0x00, 0x02    ; test byte [eax*2 + 0xf1ac2], 2
    jne near loc_0372
    cmp byte [0x7fd8], 0
    je short loc_0687
    call 0x12860
loc_0687:
    call 0x12950
    call 0x61a10
    jmp near loc_03e3
loc_0696:
    mov eax, 0xf8
    call 0x15ff0
    pop ebp
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
    db 0x8b, 0xc0    ; mov eax, eax
%else
    db 0x8d, 0x80, 0x00, 0x00, 0x00, 0x00    ; lea eax, [eax]
    db 0x8b, 0xd2    ; mov edx, edx
    push ebx
    push ecx
    push esi
    push edi
    push ebp
    mov ebx, eax
    mov ecx, 1
    mov eax, 3
    mov dword [0xe934f], ecx
    int 0x10
    mov eax, 0xb5c
    mov dword [0xe97df], ecx
    call 0x7a5fc
    mov eax, ebx
    call 0x20ec0
    call 0x9a41c
    mov dl, byte [0x7fb2]
    mov dword [0x8d74], eax
    test dl, dl
    jne short loc_0093
    cmp eax, 0x2ae860
    jge short loc_00a1
    mov eax, 0xb68
    call 0xa2a43
    mov eax, 0xba0
    call 0xa2a43
    mov eax, 0xbdc
    call 0xa2a43
    mov eax, 0x2ae860
    sub eax, dword [0x8d74]
    push eax
    push 0xbf8
    call 0xa2784
    add esp, 8
    xor eax, eax
    call 0xa296e
    jmp short loc_00a1
loc_0093:
    push eax
    push 0xc28
    call 0xa2784
    add esp, 8
loc_00a1:
    mov eax, 0x116c0
    call 0x9baa4
    call 0x21800
    mov eax, dword [0x223ac]
    cmp eax, 4
    ja short loc_00f2
    jmp dword cs:[eax*4 + 0x11d74]
    mov dword [0x2272c], 0xc44
    jmp short loc_00fc
    mov dword [0x2272c], 0xc50
    jmp short loc_00fc
    mov dword [0x2272c], 0xc5c
    jmp short loc_00fc
    mov dword [0x2272c], 0xc74
    jmp short loc_00fc
loc_00f2:
    mov dword [0x2272c], 0xc68
loc_00fc:
    cmp byte [0x7e54], 0
    je short loc_016e
    cmp word [0x261214], 1
    jle short loc_016e
    cmp dword [0x1275d4], 0xd
    je short loc_016e
    mov eax, 0xc80
    call 0xa2a43
    mov eax, 0xccc
    call 0xa2a43
    mov eax, 0xcec
    call 0xa2a43
    mov eax, 0xd38
    call 0xa2a43
    mov eax, 0xd84
    call 0xa2a43
    mov eax, 0xdd0
    call 0xa2a43
    mov eax, 0xe08
    call 0xa2a43
loc_015e:
    call 0x9eedc
    test eax, eax
    jne short loc_016e
    call 0x10800
    jmp short loc_015e
loc_016e:
    mov bx, word [0x261214]
    cmp bx, 1
    jle short loc_018a
    movsx eax, bx
    mov dword [0xe97df], eax
    call 0x7b7a2
    jmp short loc_01ad
loc_018a:
    cmp byte [0x7ee0], 0
    je short loc_01ad
    mov ebp, 7
    mov bh, 1
    xor eax, eax
    mov dword [0xe97d7], ebp
    mov dword [0xe97db], eax
    mov byte [0xe8d7d], bh
loc_01ad:
    cmp dword [0xe97df], 1
    jle short loc_01dd
    mov al, byte [0xe97df]
    mov cl, byte [0xe8d7d]
    mov byte [0x22746], al
    test cl, cl
    jne short loc_01dd
    mov ebx, 1
    xor ecx, ecx
    mov dword [0xe97c3], ebx
    mov dword [0xe97d3], ecx
loc_01dd:
    mov ecx, 0xffffffff
    mov esi, dword [0x11ebc8]
    mov word [0xe92fb], cx
    test esi, esi
    je short loc_0205
    push 0xe9270
    push 0xe54
    call 0xa2784
    add esp, 8
loc_0205:
    cmp dword [0x13fd4], 0
    je short loc_022c
    push 0x16fa0
    mov ecx, 0x16f90
    mov ebx, 0x16f80
    mov edx, 0x16f70
    mov eax, 0x16f60
    call 0x9fbc0
loc_022c:
    mov ebx, dword [0x127584]
    mov edx, dword [0x1275a8]
    mov eax, dword [0x127590]
    call 0x63908
    test eax, eax
    jge short loc_0289
    mov ebp, dword [0x2454b4]
    push ebp
    mov eax, dword [0x2454b8]
    push eax
    push 0xe68
    mov edx, 2
    mov ch, 2
    call 0xa2784
    mov eax, 2
    mov ebx, dword [0x127584]
    add esp, 0xc
    mov dword [0x127590], edx
    mov edx, dword [0x1275a8]
    mov byte [0x246590], ch
    call 0x63908
loc_0289:
    movsx edx, word [0x261216]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    db 0x8b, 0x14, 0x45, 0xe5, 0x52, 0x0b, 0x00    ; mov edx, dword [eax*2 + 0xb52e5]
    mov eax, dword [0xe97af]
    sar eax, 2
    call 0x73f1a
    cmp byte [0x2c2381], 0
    je short loc_02c7
    mov eax, 0xf8
    call 0x16030
loc_02c7:
    call 0x94a94
    call 0x5b280
    cmp byte [0xe8d7d], 1
    jbe near loc_038d
    cmp dword [0xe97df], 2
    jge near loc_038d
    xor eax, eax
    call 0x76795
    movsx edx, word [0x261216]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    mov ecx, 0x1c08a4
    sub eax, edx
    xor ebx, ebx
    xor edx, edx
    db 0x89, 0x0c, 0x45, 0xe5, 0x52, 0x0b, 0x00    ; mov dword [eax*2 + 0xb52e5], ecx
    xor ecx, ecx
    xor eax, eax
    call 0x46520
    mov eax, dword [0x2454b4]
    dec eax
    push eax
    mov eax, dword [0x2454b8]
    dec eax
    push eax
    push 0
    push 0
    push 0x4a
    push 0
    push 0
    mov ebx, 0x10000
    mov edx, 0x640000
    push 0xcd1
    xor ecx, ecx
    mov eax, 0xa00000
    call 0x7169e
    push 0xea0
    mov edx, 0x69
    mov eax, 0xa0
    xor ecx, ecx
    xor ebx, ebx
    call 0x41610
    call 0x64550
    mov al, byte [0xe8d7d]
    sub al, 2
    movsx eax, al
    call 0x3f5c0
    test eax, eax
    je short loc_038d
    xor dl, dl
    mov byte [0xe8d7d], dl
loc_038d:
    call 0x10800
loc_0392:
    mov dh, byte [0xe8d7d]
    test dh, dh
    jne short loc_03a3
    call 0x215b0
    jmp short loc_03d5
loc_03a3:
    cmp dh, 1
    jne short loc_03d0
    xor ebx, ebx
    xor edx, edx
    xor eax, eax
    mov bl, byte [0xe97d3]
    mov dl, byte [0xe97d7]
    mov al, byte [0xe97db]
    call 0x51f30
    mov eax, 4
    call 0x52d80
    jmp short loc_03d5
loc_03d0:
    call 0x50a30
loc_03d5:
    mov bh, byte [0xe8d7d]
    mov edx, dword [0xe9337]
    test bh, bh
    jne short loc_0402
    call 0x22ac0
    test eax, eax
    je short loc_0402
    call 0x94a94
    mov ch, 1
    call 0x5b280
    mov byte [0x22743], ch
    jmp short loc_0392
loc_0402:
    xor cl, cl
    mov dword [0xe9337], edx
    mov byte [0xe8d7d], cl
loc_0410:
    movsx ebx, word [0x261216]
    mov eax, ebx
    shl eax, 7
    sub eax, ebx
    lea eax, [eax*4]
    sub eax, ebx
    add eax, eax
    mov dl, byte [eax + 0xb52a2]
    test dl, 0x80
    jne near loc_06bf
    cmp dword [0xe97a7], 2
    je short loc_045b
    cmp dword [0xe97df], 1
    jg short loc_045b
    cmp byte [0xe8d81], 0
    jne short loc_0485
    mov al, dl
    and al, 1
    cmp al, 1
    je short loc_0485
loc_045b:
    movsx ebx, word [0x261216]
    mov eax, ebx
    shl eax, 7
    sub eax, ebx
    lea eax, [eax*4]
    sub eax, ebx
    db 0xf6, 0x04, 0x45, 0xa2, 0x52, 0x0b, 0x00, 0x04    ; test byte [eax*2 + 0xb52a2], 4
    je short loc_0485
    call 0x23040
    test al, al
    jne short loc_0410
loc_0485:
    movsx ebx, word [0x261216]
    mov eax, ebx
    shl eax, 7
    sub eax, ebx
    lea eax, [eax*4]
    sub eax, ebx
    add eax, eax
    mov bh, byte [eax + 0xb52a2]
    test bh, 8
    jne short loc_04b2
    test bh, 0x20
    je near loc_05be
loc_04b2:
    movsx ebx, word [0x261216]
    mov eax, ebx
    shl eax, 7
    sub eax, ebx
    lea eax, [eax*4]
    sub eax, ebx
    db 0xf6, 0x04, 0x45, 0xa2, 0x52, 0x0b, 0x00, 0x08    ; test byte [eax*2 + 0xb52a2], 8
    je near loc_055d
    call 0x22a30
    mov ebx, dword [0xe934b]
    xor cl, cl
    xor ebp, ebp
    mov byte [0xe983a], cl
    mov dword [0xe934b], ebp
    call 0x50a30
    xor eax, eax
    mov dword [0xe934b], ebx
    call 0x24bb0
    cmp byte [0xe8d7f], 0
    je short loc_055d
    xor al, al
    mov byte [0xe8d7f], al
    cmp dword [0xe97df], 2
    jge short loc_0551
    movsx edx, word [0x261216]
    mov eax, edx
    shl eax, 7
    sub eax, edx
    lea eax, [eax*4]
    sub eax, edx
    db 0xc6, 0x04, 0x45, 0xa2, 0x52, 0x0b, 0x00, 0x01    ; mov byte [eax*2 + 0xb52a2], 1
    xor eax, eax
    xor edi, edi
    call 0x3f2c0
    mov word [0x8fdc], di
    jmp near loc_0392
loc_0551:
    mov dword [0xe97d7], ebp
    mov dword [0xe97e7], ebp
loc_055d:
    xor ah, ah
    mov si, word [0x261214]
    mov byte [0xe983a], ah
    cmp si, 1
    jle short loc_0591
    movsx ebx, word [0x261216]
    mov eax, ebx
    shl eax, 7
    sub eax, ebx
    lea eax, [eax*4]
    sub eax, ebx
    db 0xc6, 0x04, 0x45, 0xa2, 0x52, 0x0b, 0x00, 0x04    ; mov byte [eax*2 + 0xb52a2], 4
loc_0591:
    movsx ebx, word [0x261216]
    mov eax, ebx
    shl eax, 7
    sub eax, ebx
    lea eax, [eax*4]
    sub eax, ebx
    db 0x8a, 0x04, 0x45, 0xa2, 0x52, 0x0b, 0x00    ; mov al, byte [eax*2 + 0xb52a2]
    and eax, 0xff
    call 0x52d80
    jmp near loc_0410
loc_05be:
    call 0x1f330
    call 0x20400
    cmp byte [0xe8d81], 0
    jne short loc_05fb
    cmp dword [0xe97df], 2
    jge short loc_05fb
    movsx ebx, word [0x261216]
    mov eax, ebx
    shl eax, 7
    sub eax, ebx
    lea eax, [eax*4]
    sub eax, ebx
    db 0xf6, 0x04, 0x45, 0xa2, 0x52, 0x0b, 0x00, 0x01    ; test byte [eax*2 + 0xb52a2], 1
    je short loc_060d
loc_05fb:
    cmp dword [0xe97df], 1
    jg short loc_060d
    cmp dword [0xe97a7], 2
    jne short loc_0663
loc_060d:
    mov eax, dword [0x2454ac]
    mov ebx, dword [0xe54ac]
    sub eax, ebx
    shl eax, 0xe
    test eax, eax
    jle short loc_062d
    mov eax, dword [0x2454ac]
    sub eax, ebx
    shl eax, 0xe
    jmp short loc_062f
loc_062d:
    xor eax, eax
loc_062f:
    cmp eax, 0x10000
    jge short loc_065a
    mov eax, dword [0x2454ac]
    mov esi, dword [0xe54ac]
    sub eax, esi
    shl eax, 0xe
    test eax, eax
    jle short loc_0656
    mov eax, dword [0x2454ac]
    sub eax, esi
    shl eax, 0xe
    jmp short loc_065f
loc_0656:
    xor eax, eax
    jmp short loc_065f
loc_065a:
    mov eax, 0x10000
loc_065f:
    mov ebx, eax
    jmp short loc_0668
loc_0663:
    mov ebx, 0x10000
loc_0668:
    movsx eax, word [0xe8cc6]
    mov edx, ebx
    call 0x18420
    mov eax, ebx
    call 0x172c0
    movsx ebx, word [0x261216]
    mov eax, ebx
    shl eax, 7
    sub eax, ebx
    lea eax, [eax*4]
    sub eax, ebx
    db 0xf6, 0x04, 0x45, 0xa2, 0x52, 0x0b, 0x00, 0x02    ; test byte [eax*2 + 0xb52a2], 2
    jne near loc_0392
    cmp byte [0x7fb0], 0
    je short loc_06b0
    call 0x12860
loc_06b0:
    call 0x12950
    call 0x64550
    jmp near loc_0410
loc_06bf:
    mov eax, 0xf8
    call 0x16030
    pop ebp
    pop edi
    pop esi
    pop ecx
    pop ebx
    ret
    db 0x8d, 0x80, 0x00, 0x00, 0x00, 0x00    ; lea eax, [eax]
    db 0x8d, 0x52, 0x00    ; lea edx, [edx]
%endif
