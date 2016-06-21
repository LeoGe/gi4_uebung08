;Zahlen sind im Hexadezimalsystem angegeben
;dahinter Adressmodus: es wird nicht ein Register adressiert. Register: ein Register wird adressiert.

0000  SECTION .text	;Pseudo
0000	extern printf	;Pseudo
0000	extern exit	;Pseudo
0000	global main	;Pseudo
0000	global msg	;Pseudo
	
0000  main:	;Pseudo
0000	push ebp	;(2) opCode+Register
0002	mov ebp , esp	;(3) opCode+2*Register
0005	sub esp, 4	;(7)opCode+Register+Adressmodus+Immediate
	
000C	mov ebx, 0x39	;(7) opCode+Register+Adressmodus+Immediate
0013	mov dword [ebp-4], 0x30	;(B) opCode+2*Adressmodus+Displacement+Immediate
	
001E  schleife:	;Pseudo
001E	cmp ebx , dword [ebp-4]	;(7) opCode+Register+Adressmodus+Displacement
0025	je ende	;(6) opCode+Adressmodus+Immediate
	
002B	mov byte [msg+msg_len -4], bl	;(7) opCode+Adressmodus+Register+Immediate
	
0032	push dword msg	;(6) opCode+Adressmodus+Immediate
0038	call printf	;(6) opCode+Adressmodus+Immediate
003E	add esp, 4	;(7) opCode+Resgister+Adressmodus+Immediate
	
0045	dec ebx		;(2) OpCode+Register
0047	jmp schleife	;(6) opCode+Adressmodus+Immediate
	
004D  ende:	;Pseudo
004D	add esp, 4	;(7) opCode+Register+Adressmodus+Immediate
0054	pop ebp		;(2) opCode+Register
	
0056	push dword 0	;(6) opCode+Adressmodus+Immediate
005C	call exit	;(6) opCode+Adressmodus+Immediate
0062	add esp, 4	;(7) opCode+Register+Adressmodus+Immediate
	
0069	mov eax, 1	;(7) opCode+Register+Adressmodus+Immediate
0070	mov ebx, 0	;(7) opCode+Register+Adressmodus+Immediate
0077	int 0x80	;(6) opCode+Adressmodus+Immediate
	
007D  SECTION .data	;Pseudo
007D	CR equ 13	;Pseudo
007D	LF equ 10	;Pseudo
007D	msg db "Hello World! ebx = ?", CR, LF, 0 ;Pseudo (17)
0094	msg_len equ $ - msg	;Pseudo

;Länge des Codesegments: 007D (125 in dezimal)
;Länge des Datensegments: 0017 (23 in dezimal)
;Gesamtlänge: 0094 (148 in dezimal)
