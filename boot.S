org 0x7c00

start:
	mov ah, 0x00
	mov al, 0x03
	int 0x10
	mov ah, 0x0e
	mov al, 'H'
	int 0x10
	mov al, 'e'
	int 0x10
	mov al, 'l'
	int 0x10
	int 0x10
	mov al, 'o'
	int 0x10
	mov al, ' '
	int 0x10
	mov al, 'W'
	int 0x10
	mov al, 'o'
	int 0x10
	mov al, 'r'
	int 0x10
	mov al, 'l'
	int 0x10
	mov al, 'd'
	int 0x10
		
	jmp read
	jmp print

	jmp $

read:
	mov ah, 0x0
	int 0x16
	jmp print

print:
	cmp al, 0x0D
	je new_line
	cmp al, 0x08
	je backspace
	mov ah, 0xe
	int 0x10
	jmp read
	
new_line:
	mov ah, 0x2
	mov dl, 0
	add dh, 1
	int 0x10
	jmp read

backspace:
	mov ah, 0x3
	int 0x10
	mov ah, 0x2
	sub dl, 1
	int 0x10
	mov ah, 0x0e
	mov al, 0x00
	int 0x10
	mov ah, 0x3
	int 0x10
	mov ah, 0x2
	sub dl, 1
	int 0x10
	jmp read

times 510 - ($ - $$) db 0
dw 0xaa55
