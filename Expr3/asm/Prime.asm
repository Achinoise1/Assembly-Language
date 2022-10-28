title Prime
INCLUDE Irvine32.inc

.data
	flag	DWORD		0
	pW		BYTE "It's a Prime number",0
	npW     BYTE "It's not a Prime number",0
	hint    BYTE "Please input a number:",0
.code
Prime PROC,
	val:DWORD
	mov		flag,	0
	mov		ecx,	1
	cmp		val,	-1
	jz		L1
L0:
	.while ecx <= val
		mov edx,	0
		mov	eax,    val
		div	ecx
		.if edx == 0
			add flag,	1
		.endif
		inc ecx
	.endw
L1:
	ret
Prime ENDP

main proc
Lp1:
	mov		edx,	offset hint
	call	WriteString
	call	ReadInt
	push	eax
	call	Prime
	mov		ebx,	flag
	.if		flag == 0
	ret
	.endif
	cmp		ebx,	2	
	jz		L2
	jnz		L3

L2:
	mov		EDX,	offset pW
	call	WriteString 
	jmp		L4
L3:
	mov		EDX,	offset npW
	call	WriteString
	jmp		L4

L4:
	mov		flag,	0
	call    Crlf
	call	Lp1

L5:
	call	WaitMsg
	ret
main endp 
end main
