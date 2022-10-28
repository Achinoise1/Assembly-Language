title three

INCLUDE	Irvine32.inc

.data
	ArrayA		dword	5	Dup(0)
	ArrayB		dword	5	Dup(0)
	ArrayC		dword	5	Dup(0)
	avgA		dword	0
	avgB		dword	0
	avgC		dword	0
	Num			dword	5
	hInput		byte	"Input five numbers:",0
	hOutput		byte	"The average of the array is: ",0
	AllOutput	byte	"The average of all the elements is: ",0
	AllSum		byte	"The sum of all the elements is: ",0
	max			dword	0
	maxOne		byte	"The max element is: ",0
.code
main proc

IA:
	mov			ecx,0
	mov			esi,0
	mov			edx,offset hInput
	call		WriteString
	.while		ecx< 5
		call		ReadDec
		mov			ArrayA[esi],eax
		.if			eax > max
			mov			max,eax
		.endif
		add			avgA,eax
		sar			esi,2
		inc			ecx
	.endw
	jmp			AvgAA
IB:
	mov			ecx,0
	mov			esi,0
	mov			edx,offset hInput
	call		WriteString
	.while		ecx< 5
		call		ReadDec
		mov			ArrayB[esi],eax
		.if			eax > max
			mov			max,eax
		.endif
		add			avgB,eax
		add			esi,4h
		inc			ecx
	.endw
	jmp			AvgAB
IC:
	mov			ecx,0
	mov			esi,0
	mov			edx,offset hInput
	call		WriteString
	.while		ecx< 5
		call		ReadDec
		mov			ArrayC[esi],eax
		.if			eax > max
			mov			max,eax
		.endif
		add			avgC,eax
		add			esi,4h
		inc			ecx
	.endw
	jmp			AvgAC

AvgAA:	
	;call		WriteDec
	mov			edx,0			;这里必须清零，else会出bug
	mov			eax,avgA
	mov			esi,5
	div			esi
	mov			edx,offset hOutput
	call		WriteString
	call		WriteDec
	call		Crlf
	jmp			IB
	

AvgAB:	
	;call		WriteDec
	mov			edx,0			;这里必须清零，else会出bug
	mov			eax,avgB
	mov			esi,5
	div			esi
	mov			edx,offset hOutput
	call		WriteString
	call		WriteDec
	call		Crlf
	jmp			IC

AvgAC:	
	;call		WriteDec
	mov			edx,0			;这里必须清零，else会出bug
	mov			eax,avgC
	mov			esi,5
	div			esi
	mov			edx,offset hOutput
	call		WriteString
	call		WriteDec
	call		Crlf

SumAvg:
	mov			eax,avgA
	add			eax,avgB
	add			eax,avgC
	mov			edx,offset AllSum
	call		WriteString
	call		WriteDec
	call		Crlf
	mov			edx,0
	mov			esi,15
	div			esi
	mov			edx,offset AllOutput
	call		WriteString
	call		WriteDec
	call		Crlf

TheMax:
	mov			edx,offset maxOne
	call		WriteString
	mov			eax,max
	call		WriteDec
	call		Crlf

	call		WaitMsg
main endp
end main