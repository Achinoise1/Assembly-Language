title Two
INCLUDE Irvine32.inc

.data
	ArraySize	dword	0
	ArrayA		dword	20		DUP(0)
	ArrayB		dword	20		DUP(0)
	ArrayC		dword	20		DUP(0)
	ArrA		byte	"Array A",0		
	ArrB		byte	"Array B",0	
	ArrC		byte	"Array C",0	
	InputSize	byte	"Input the array size: ",0
	InputNum	byte	"Input a number: ",0
	Output		byte	"Result: ",0

.code
main proc
	mov			edx,offset InputSize
	call		WriteString
	call		ReadDec
	mov			ArraySize,eax
	mov			ecx,0
	mov			esi,0
	mov			edx,offset ArrA
	CALL		WriteString
	call		Crlf
	mov			edx,offset InputNum
	.while		ecx < ArraySize
		call		WriteString
		call		ReadDec
		mov			ArrayA[esi],eax
		inc			ecx
		add			esi,4
	.endw
	mov			ecx,0
	mov			esi,0
	mov			edx,offset ArrB
	CALL		WriteString
	call		Crlf
	mov			edx,offset InputNum
	.while		ecx < ArraySize
		call		WriteString
		call		ReadDec
		mov			ArrayB[esi],eax
		inc			ecx
		add			esi,4
	.endw
	mov			ecx,0
	mov			esi,0
	mov			edx,offset ArrC
	CALL		WriteString
	call		Crlf
	mov			edx,offset InputNum
	.while		ecx < ArraySize
		mov			eax,ArrayA[esi]
		add			eax,ArrayB[esi]
		mov			ArrayC[esi],eax
		inc			ecx
		add			esi,4
	.endw
	mov			ecx,0
	mov			esi,0
	mov			edx,offset Output
	call		WriteString
	.while		ecx < ArraySize
		mov			eax,ArrayC[esi]
		call		WriteDec
		mov			al,' '
		call		WriteChar
		inc			ecx
		add			esi,4
	.endw
	call		Crlf
	call		WaitMsg
main endp
end main