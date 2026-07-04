section .data


; Input variables (16-bit words and one 32-bit doubleword)
wNum1   dw  5
wNum2   dw  10
wNum3   dw  15
wNum4   dw  3
dNum1   dd  150   

; Output variables initialized to 0
wAns1   dw  0
wAns2   dw  0
wAns3   dw  0
wAns6   dw  0
wAns7   dw  0
wAns8   dw  0

dAns11  dd  0
dAns12  dd  0
dAns13  dd  0

wAns16  dw  0
wAns17  dw  0
wAns18  dw  0
wRem18  dw  0


section .text

global _start

_start:

;wAns1 = wNum1 + wNum2  
mov ax, [wNum1]
add ax, [wNum2]
mov [wAns1], ax

;wAns6 = wNum1 – wNum2  
mov ax, [wNum1]
sub ax, [wNum2]
mov [wAns6], ax

;dAns11 = wNum1 * wNum3  

mov ax, [wNum1]
mul word[wNum3]
mov [dAns11], ax    ;lower 16
mov [dAns11 + 2], dx ;upper 16

;10.  wAns16 = wNum1 / wNum2  
mov ax, [wNum1]
xor dx, dx
div word[wNum2]
mov [wAns16], ax

; 13.  wRem18 = dNum1 % wNum4  
mov ax, [dNum1]
mov dx, [dNum1 + 2]
div word[wNum4]
mov [wRem18], dx

mov eax, 60         ; sys_exit system call number
mov edi, 0          ; exit code 0 (success)
syscall             ; call the kernel to exit

