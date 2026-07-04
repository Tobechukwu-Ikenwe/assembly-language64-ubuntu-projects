section .data

; variables

bNum1 db -20
bNum2 db -10
bNum3 db -15
bNum4 db -3
wNum1 dw -5

; initialized to 0

bAns1    db  0
bAns2    db  0
bAns3    db  0
bAns6    db  0
bAns7    db  0
bAns8    db  0

wAns11   dw  0
wAns12   dw  0
wAns13   dw  0

bAns16   db  0
bAns17   db  0
bAns18   db  0
bRem18   db  0



section .text

global _start

_start:
;add
;1. bAns1 = bNum1 + bNum2  

  mov al, [bNum1]
  add al, [bNum2]
  mov [bAns1], al

;2. bAns2 = bNum1 + bNum3  

  mov al, [bNum1]
  add al, [bNum3]
  mov [bAns2], al

;3. bAns3 = bNum3 + bNum4  

  mov al, [bNum3]
  add al, [bNum4]
  mov [bAns3], al


; sub 
;4. bAns6 = bNum1 – bNum2  

  mov al, [bNum1]
  sub al, [bNum2]
  mov [bAns6], al



;imul
;7.
  ;wAns11 = bNum1 * bNum3  
  mov al, [bNum1]
  imul byte [bNum3]
  mov [wAns11], ax



;div

;10.  bAns16 = bNum1 / bNum2  

  mov al, [bNum1]
  cbw
  idiv byte [bNum2]
  mov [bAns16], al


;13.  bRem18 = wNum1 % bNum4  

  mov ax, [wNum1]
  cwd
  movsx cx, byte [bNum4]
  idiv cx
  mov [bRem18], dl


  mov eax, 60         ; sys_exit system call number
  mov edi, 0          ; exit code 0 (success)
  syscall             ; call the kernel to exit
