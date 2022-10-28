title One
INCLUDE Irvine32.inc

.data
	col			dword	?
	row			dword	?
	character	byte	?
	hInput		byte	"Input a character: ",0
	cInput		byte	"Input the times you wanna print the character in one line: ",0
	rInput		byte	"Input the rows you wanna print: ",0
	Output		byte	"Output: ",0
.code
main proc
	mov			edx,offset hInput
	call		WriteString
	call		ReadChar
	mov			character,al
	call		WriteChar
	call		Crlf
	mov			edx,offset rInput
	call		WriteString
	call		ReadDec
	mov			col,eax
	mov			edx,offset cInput
	call		WriteString
	call		ReadDec
	mov			row,eax
	mov			ecx,0
	mov			edx,0
	call		Crlf
	mov			edx,offset Output
	call		WriteString
	call		Crlf
	mov			edx,0
	.while		ecx < col
		.while		edx < row
			mov			al,character
			call		WriteChar
			mov			al,' '
			call		WriteChar
			inc			edx
		.endw
		mov		edx,0
		call	Crlf
		inc		ecx
	.endw
	call		WaitMsg
main endp
end main