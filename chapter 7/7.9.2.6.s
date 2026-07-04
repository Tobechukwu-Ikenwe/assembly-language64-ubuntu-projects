section .data

; Input variables (unsigned)

dNum1  dd  -150
dNum2  dd  -10
dNum3  dd  -15
dNum4  dd  -3

qNum1  dq  -1500

; Output variables initialized to 0

dAns1   dd  0
dAns2   dd  0
dAns3   dd  0

dAns6   dd  0
dAns7   dd  0
dAns8   dd  0

qAns11  dq  0
qAns12  dq  0
qAns13  dq  0

dAns16  dd  0
dAns17  dd  0
dAns18  dd  0

dRem18  dd  0


section .text

global _start

_start:

;dAns1 = dNum1 + dNum2  
mov eax, [dNum1]
add eax, [dNum2]
mov [dAns1], eax


;dAns6 = dNum1 – dNum2  
mov eax, [dNum1]
sub eax, [dNum2]
mov [dAns6], eax

;qAns11 = dNum1 * dNum3  
mov eax, [dNum1]
imul dword [dNum3] 
mov [qAns11], eax   ;lower 32
mov [qAns11 + 4], edx  ;upper 32 


;10.  dAns16 = dNum1 / dNum2  
mov eax, [dNum1]
cdq
idiv dword [dNum2]
mov [dAns16], eax

;13.  dRem18 = qNum1 % dNum4  
mov eax, [qNum1]   ; lower 32
mov edx, [qNum1 + 4] ; upper 32
idiv dword [dNum4]
mov [dRem18], edx
