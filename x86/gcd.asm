; x86 (32 bits)
; Use the following two commands to assemble and link
;       nasm -f elf32 gcd.asm
;       ld -m elf_i386 gcd.o -o gcd
; To run: 
;       ./gcd
; 
; Or do it on one line and write to a.out
;
;    nasm -f elf32 gcd.asm && ld -m elf_i386 gcd.o && ./a.out

global _start

section .text

_start:
main:
        ; set up two numbers, one in eax and one in ebx
        mov     eax, 36663666
        mov     ebx, 3666

.loop:
        cmp     eax, ebx
        je      .loop_exit
        jl      .else
        sub     eax, ebx        ; eax -= ebx
        jmp     .cont
.else:
        sub     ebx, eax        ; ebx -= eax
.cont:
        jmp     .loop

.loop_exit:
        push    eax
        call    print_int
        pop     eax

	; exit 0
	mov	eax, 1          ; system call number
	mov	ebx, 0
	int	0x80

; a function that print an unsigned 32-bit value in decimal, and a newline
; void print_int (int n)
; {     
;     char buffer[16];
;     int  i = 15;
;     buffer[i] = '\n'; 
;     i -= 1; 
;     while (n > 9) {
;          r = n % 10;
;          buffer[i] = r + '0';
;          i -= 1; 
;          n = n / 10;
;     }
;     buffer[i] = n + '0';
;     print character buffer[i .. 15]
;     return
; }
print_int:

        ; save registers
        push    ebp
        mov     ebp, esp
        push    ebx             ; ebx is a callee saved register

        ; Intel's DWORD is 32-bit
        ; DWORD [ebp + 8] is argument n
        ; DWORD [ebp + 4] is return address 
        ; DWORD [ebp + 0] is saved ebp
        ; DWORD [ebp - 4] is saved ebx

        ; allocate a buffer of 16 bytes, enough for 32-bit integer
        sub     esp, 16
        ; [ebp - 20] is the beginning of the temp buffer

        mov     ebx, 15
        ; comment out the following two instructions to not print the newline
        mov     BYTE [ebp-20+ebx], 10   ; save newline to buffer[15]
        dec     ebx

        mov     eax, DWORD [ebp+8]      ; n is now in eax
        mov     ecx, 10
        jmp     .loop_exit
.loop:
        xor     edx, edx                ; higher half is always 0
        div     ecx                     ; unsigned division edx:eax / 10
                
        ; eax is the quotient
        ; edx is the remainder

        ; convert the remainder to a character, and place it in the buffer
        add     edx, 48
        mov     [ebp-20+ebx], dl
        dec     ebx

.loop_exit:
        cmp     eax, 9
        jg      .loop

        ; the first digit
        add     al, 48
        mov     [ebp-20+ebx], al

        ; print the characters
        lea     ecx, [ebp-20+ebx] ; load the address in ecx
        mov     edx, 16         ; length in edx
        sub     edx, ebx
        mov     eax, 4          ; system call number
	mov 	ebx, 1		; 1 for stdout
	int	0x80

        ; could be done with LEAVE
        mov     esp, ebp        ; esp = ebp 
        pop     ebp
        ret
