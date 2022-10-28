title Str_Remove
INCLUDE Irvine32.inc

.data
	target	BYTE "abcxxxxdefghijklmop",0
	Size	BYTE lengthof target
	len		BYTE	?
.code
Remove1 PROC,
	pos:PTR BYTE,num1:WORD

	mov	bl,		byte ptr [pos]
	sub	bl,		byte ptr [target]
	mov	si, 0
	.while si < bl
		mov		al, target[si]
		call	WriteChar
		inc		si
	.endw
	add si,	num1
	.while	si < Size
		mov		al, target[si]
		call	WriteChar
		inc		si
	.endw
	ret

Remove1 endp

Remove2 PROC,
	pos:PTR BYTE, num1:WORD,num2:WORD

	mov	si,	0
	.while si < num1
		mov		al,	target[si]
		call	WriteChar
		inc		si
	.endw
	add	si,	num2
	.while si < num2
		mov		al,target[si]
		call	WriteChar
		inc		si
	.endw
	ret

Remove2 endp
main PROC
	INVOKE	Remove1, ADDR[target+3], 4
	call	Crlf
	INVOKE	Remove2, ADDR target, 4, 4
	call	Crlf
main endp
end main
