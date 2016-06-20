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
	
002B	mov byte [msg+msg_len -4], bl	;(B) opCode+Adressmodus+Register+Displacement+Immediate
	
0036	push dword msg	;(6) opCode+Adressmodus+Immediate
003C	call printf	;(6) opCode+Adressmodus+Immediate
0048	add esp, 4	;(7) opCode+Resgister+Adressmodus+Immediate
	
004F	dec ebx		;(2) OpCode+Register
0051	jmp schleife	;(6) opCode+Adressmodus+Immediate
	
0057  ende:	;Pseudo
0057	add esp, 4	;(7) opCode+Register+Adressmodus+Immediate
005B	pop ebp		;(2) opCode+Register
	
005D	push dword 0	;(6) opCode+Adressmodus+Immediate
0063	call exit	;(6) opCode+Adressmodus+Immediate
0069	add esp, 4	;(7) opCode+Register+Adressmodus+Immediate
	
0070	mov eax, 1	;(7) opCode+Register+Adressmodus+Immediate
0077	mov ebx, 0	;(7) opCode+Register+Adressmodus+Immediate
007E	int 0x80	;(6) opCode+Adressmodus+Immediate
	
0000  SECTION .data	;Pseudo
0000	CR equ 13	;Pseudo
0000	LF equ 10	;Pseudo
0000	msg db "Hello World. ebx = ?", CR, LF, 0 ;Pseudo (17)
0017	msg_len equ $ - msg	;Pseudo
