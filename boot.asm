;imageboot-16 by aolvos, 2020
Bits 16

;set videomode

mov ah,00h
mov al,13h
int 10h

;create stack

cli
mov ax,0x0000
mov ss,ax
mov sp,0xFFFF
sti

;main module

boot_ok:
call splash_image
cli
hlt

splash_image:

;load data in memory

mov cl,0x02
call read_data
xor di,di

;setup palette

mov bx,0

setup_palette:
lodsb
mov dh,al
lodsb
mov ch,al
lodsb
mov cl,al
mov ax,1010h
int 10h
inc bx
cmp bx,16
jne setup_palette

;write data

mov cx,32000
call write_data

mov cl,0x21
call read_data
mov di,31968

mov cx,64000
call write_data

mov dx,0x3C8
xor al,al
out dx,al
mov dx,0x3C9
mov cx,768

ret

write_data:
lodsb
push ax
shr al,4
stosb
pop ax
shl al,4
shr al,4
stosb
cmp di,cx
jne write_data
ret

read_data:
mov ax,07c0h
mov ds,ax
mov es,ax

mov ah,02h
mov al,32
mov ch,0
mov dh,0
mov bx,0x1000
int 13h

mov ax,0A000h
mov es,ax
mov si,0x1000
ret

times 510-($-$$) db 0
dw 0xAA55