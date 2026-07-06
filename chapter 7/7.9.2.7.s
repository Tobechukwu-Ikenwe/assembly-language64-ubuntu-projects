; sum of squares from 1 to n

section .data

n db 10 ;select 10 
sum dw 0 ; running sum = 0 atm

section .text

global _start

_start:



; loop from 1 to n
; move 10 into loop counter
movzx rcx, byte[n]

mov rsi, 1
; move running total to rbx
movzx rbx, word[sum]


loop_start:
  ;multiply rax by itself
  mov rax, rsi
  mul rax
  add rbx, rax
  
  add rsi, 1
  dec rcx ; move to the next iteration
  jnz loop_start
  
mov eax, 60         ; sys_exit system call number
mov edi, 0          ; exit code 0 (success)
syscall             ; call the kernel to exit
  
  
  

