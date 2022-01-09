BITS 16
ORG 0x7C00 ;Constante
mov [DriveNum] , dl
mov esi , MsgHello
call print

mov ah, 2
mov al, 1
mov dl , [DriveNum]
mov ch , 0
mov dh , 0
mov cl , 2
mov bx , 0x1000

int 0x13
cmp ah , 0
JNE err
mov esi,Debug_MsgOK

mov esi,MsgPassingControl
call print
JMP 0x1000 ;; Jump To Stage 2

;;CODE END

;;ROUTINES START
err:
mov esi,MsgErr
call esi
call hang



asciToDigit:
 and eax,0b11001111
 ret

digitToAsci:
 xor eax,0b00110000
 ret

hang:
 JMP $

strlen:
mov ebx,eax
strlen_inc:
cmp byte [ebx],0			
JE strlen_done
inc ebx
JMP strlen_inc
strlen_done:
sub ebx,eax
mov eax,ebx
ret

strreverse: ;;eax source - ebx - strlen - edi - dest
xor edx, edx
sub edi,1
mov esi,eax
add eax , ebx
strreverse_loop:
cmp esi,eax
JG strreverse_done
mov dl , byte [eax]
mov byte [edi] , dl
inc edi
dec eax
JMP strreverse_loop
strreverse_done:
ret

asciToInt:
xor eax,eax
xor esi,esi
mov edi , 10
asciToInt_inc:
cmp esi,ebx
JE asciToInt_Done				
inc esi
mov dl , byte [ecx]
and dl,0b11001111
add al , dl
mul edi
inc ecx
JMP asciToInt_inc
asciToInt_Done:
idiv edi
ret

print:
 mov al , [si] ;Letter
 inc esi ;; Increment Pointer
 cmp al , 0
 JE print_done

 mov ah , 0x0E ;Output Mode
 mov bh , 0    ;Page
 mov bl , 0x07 ;Colour
 int 0x10   ;Interrupt
 JMP print
 print_done:
 ret
;;ROUTINES END

;;DECLARATIONS START

DriveNum dd 0
MsgHello db "Fase uno del arranque (Boot)",0xA,13,0
Debug_MsgOK db "OK",0xA,13,0
Debug_MsgNO db "NO",0xA,13,0
MsgErr db "Err",0xA,13,0
MsgPassingControl db "Pasando el control a la fase dos del arranque (kernel)",0xA,13,0
MsgDriveReady db " Disco preparado . . .",0xA,13,0
Temp db 0,0,0,0,0,0,0,0,0,0,0
TIMES 510 - ( $ - $$ ) db 0 ; Constante
DW 0xAA55  ; Constante
