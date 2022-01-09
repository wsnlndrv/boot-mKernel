BITS 16
ORG 0x1000
start:
mov esi , MsgHello
call print
JMP $

print:
mov AL , [si] ;Letter
inc esi ;; Increment Pointer
cmp AL , 0
JE done

mov AH , 0x0E ;Output Mode
mov BH , 0    ;Page
mov BL , 0x07 ;Colour
int 0x10   ;Interrupt
JMP print
done:
ret
MsgHello db "Kernel cargado.",0xA,13,0
