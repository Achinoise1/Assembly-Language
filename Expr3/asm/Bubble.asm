title Bubble
INCLUDE Irvine32.inc

.data
	Data1	DWORD	10	 Dup(?)
	temp1	DWORD	0
	temp2	DWORD	0
	hint	BYTE	"Input 10 numbers: ",0
	input	BYTE	"Before sorting: ",0
	output	BYTE	"After sorting: ",0
.code

Bubble	PROC,
	Data: PTR DWORD
	mov		edx, offset input
	call	WriteString
	mov		ebx,0
	mov		ecx,0
	.while	ecx < 10
		mov		eax,Data
		add		eax,ebx
		call	WriteInt
		mov		al,' '
		call	WriteChar
		inc		ecx
		add		ebx,4h
	.endw
	mov	ecx,0
	mov	esi,0
	mov	eax,0
	mov	edx,0
	.while ecx < 10
		.while	esi	<	ecx
			mov	ebx,	Data
			add	ebx,	edx
			mov	edi,	Data
			add edi,	eax
			.if	ebx <	edi
			mov edx,edi
			mov	eax,ebx
			.endif
			inc	esi
			add eax,4h
		.endw
		mov	eax,0
		mov	esi,0
		inc ecx
		add edx,4h
	.endw
	mov	ecx,0
	mov	ebx,0
	mov eax,0
	call	Crlf
	mov		edx, offset output
	call	WriteString
	.while ecx < 10
		mov		eax, Data
		add		eax, ebx
		call	WriteInt
		mov		al,' '
		call	WriteChar
		inc		ecx
		add		ebx,4h
	.endw
	call	Crlf
	ret
Bubble endp    

main	PROC
	mov		edx,offset hint
	call	WriteString
	mov		ecx,	0
	mov		ebx,	0
	.while	ecx < 10
		call	ReadInt
		mov		ebx,	Data1
		add		ebx,	eax
		inc		ecx
		add		ebx,4h
	.endw
	push Data1
	call	Bubble
	call	WaitMsg
main endp	
end	main 