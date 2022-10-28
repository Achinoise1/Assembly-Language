title  Again

INCLUDE	Irvine32.inc

.data
	array	dword	128		DUP(?)
	time	dword	0
	desOut	dword	?
	desIn	dword	?
	total	dword	?
	four	DWORD	4
	hintScore		BYTE "Score: ",0
	hintGrade		BYTE "		Grade: ",0

.code
main proc
	mov		ebx, 0
	mov		edx, 0
Input:
	call	ReadInt
	cmp		eax,0
	jl		Bubble
	cmp		eax,100
	jg		Bubble
	mov		[ebx+array],eax
	add		ebx,4
	mov		eax,lengthof array
	mul		four
	cmp		ebx,lengthof array
	jge		Bubble
	jmp		Input

Bubble:
	mov		eax,ebx
	dec		eax
	mul		four
	mov		desOut,eax
	add		eax,4
	mov		desIn,eax
	mov		ebx,0
	mov		edx,0
	.while	ebx < desOut
		mov		edx,ebx
		add		edx,4
		.while  edx	< desIn
			mov	ecx,[edx+array]
			.if [ebx+array] < ecx
				mov	eax,[ebx+array]
				mov	esi,[edx+array]
				mov [edx+array],eax
				mov [ebx+array],esi
			.endif
			add	 edx,4
		.endw
		add	 ebx,4
	.endw
	
	mov	ebx,0 
	.while	ebx < desIn
Loop1:
		mov		eax,[ebx+array]
		cmp		eax,0
		jle		Over
		jmp		levelA
Iter:
		add		ebx,4
	.endw

levelA:	
	cmp		eax,90
	jl		levelB
	mov		edx,OFFSET hintScore
	call	WriteString
	call	WriteDec
	mov		edx,OFFSET hintGrade
	call	WriteString
	mov		al,'A'
	call	WriteChar
	call	Crlf
	jmp		Iter

levelB:	
	cmp		eax,80
	jl		levelC
	mov		edx,OFFSET hintScore
	call	WriteString
	call	WriteDec
	mov		edx,OFFSET hintGrade
	call	WriteString
	mov		al,'B'
	call	WriteChar
	call	Crlf
	jmp		Iter

levelC:	
	cmp		eax,70
	jl		levelD
	mov		edx,OFFSET hintScore
	call	WriteString
	call	WriteDec
	mov		edx,OFFSET hintGrade
	call	WriteString
	mov		al,'C'
	call	WriteChar
	call	Crlf
	jmp		Iter

levelD:	
	cmp		eax,60
	jl		levelF
	mov		edx,OFFSET hintScore
	call	WriteString
	call	WriteDec
	mov		edx,OFFSET hintGrade
	call	WriteString
	mov		al,'D'
	call	WriteChar
	call	Crlf
	jmp		Iter

levelF:	
	mov		edx,OFFSET hintScore
	call	WriteString
	call	WriteDec
	mov		edx,OFFSET hintGrade
	call	WriteString
	mov		al,'F'
	call	WriteChar
	call	Crlf
	jmp		Iter

Over:
	call	WaitMsg
	exit
main endp
end main