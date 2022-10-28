title one
include Irvine32.inc
.data
	num		dword 10 dup(?)
	sum		dword 0
	max		dword ?
	hint	BYTE "Input a series of numbers",0
	hints	BYTE "Sum:",0
	hintm	BYTE "Max:",0

.code
main proc
	mov		ecx,10
	mov		esi,0
	;mov sum,0
	mov		edx,OFFSET hint
	call	WriteString
	call	Crlf
l1:
	mov		al,'#'
	call	WriteChar
	mov		ebx,esi
	sar		ebx,2	;右移2位
	add		ebx,1
	mov		eax,ebx
	call	WriteDec
	mov		al,':'
	call	WriteChar
	call	ReadInt	;读入后放入eax寄存器里
	add		sum,eax
	cmp		esi,0
	jne		notFirstInt
	mov		max,eax

notFirstInt:
	cmp		max,eax
	jnb		l2
	mov		max,eax

l2:
	add		esi,4
	loop	l1
	call	Crlf
	mov		edx,OFFSET hints
	call	WriteString
	mov		eax,sum
	call	WriteDec
	call	Crlf
	mov		edx,OFFSET hintm
	call	WriteString 
	mov		eax,max
	call	WriteDec
	call	Crlf
	call	WaitMsg
	exit

main endp
end main
;.data
;	num dword 10 dup(?)
;	sum dword ?
;	max dword ?

;.code
;	mov ecx,10
;	mov esi,0
;	mov sum,0
;next:
;	call readdec
;	mov num[esi],eax
;	add sum,eax
