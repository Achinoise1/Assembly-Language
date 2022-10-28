title two

INCLUDE Irvine32.inc

.data
	temp	DWORD 0
	count	DWORD 1
	hint	BYTE "Fibonacci number below the upper bound",0

.code
main proc
	mov		edx,OFFSET hint
	call	WriteString
	call	Crlf 
	MOV		AL,'#'
	CALL	WriteChar
	mov		eax,count	
	call	WriteDec
	add		count,1
	mov		al,'	'
	call	WriteChar
	mov		eax,1
	call	WriteDec
	call	Crlf
	MOV		AL,'#'
	CALL	WriteChar
	mov		eax,count	
	call	WriteDec
	add		count,1
	mov		al,'	'
	call	WriteChar
	mov		eax,1
	call	WriteDec
	call	Crlf
	mov		ebx,1
	mov		edx,1
	jmp		processing

processing:	
	mov		temp,edx
	add		edx,ebx
	jc		outstep
	MOV		AL,'#'
	CALL	WriteChar
	mov		eax,count	
	call	WriteDec
	add		count,1
	mov		al,'	'
	call	WriteChar
	mov		eax,edx
	call	WriteDec   
	call	Crlf
	mov		ebx,temp
	jmp		processing
	
outstep:
	call	WaitMsg
	exit
	
main endp
end main
