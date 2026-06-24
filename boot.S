org 0x7c00

start:
	mov ah, 0x00 ; clear screen
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

	jmp $

read:
	mov ah, 0x0 ; read single character
	int 0x16
	jmp print

print:
	cmp al, 0x0D ; check if enter key was pressed
	je new_line
	cmp al, 0x08 ; check if backspace was pressed
	je backspace
	mov ah, 0xe ; print key pressed
	int 0x10
	jmp read
	
new_line:
	mov ah, 0x2 ; set cursor pos
	mov dl, 0
	add dh, 1 ; add 1 to cursor row
	int 0x10
	jmp read

backspace:
	mov ah, 0x3 ; get cursor pos
	int 0x10
	mov ah, 0x2 ; set cursor pos
	sub dl, 1 ; subtract 1 from cursor column
	int 0x10
	mov ah, 0x0e ; remove current character
	mov al, 0x00
	int 0x10
	mov ah, 0x3 ; get cursor pos
	int 0x10
	mov ah, 0x2 ; subtract 1 from cursor column due to moving forward one from printing NULL character (to delete most recent character)
	sub dl, 1
	int 0x10
	jmp read

times 510 - ($ - $$) db 0 ; must be 510 bytes + 2 bytes from magic number
dw 0xaa55 ; magic number
