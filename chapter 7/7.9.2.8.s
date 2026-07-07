; sum of 1 to n squared

section .data

n db 10 ;select 10 

section .text

global _start

_start:



; loop from 1 to n
; move 10 into loop counter
movzx rcx, byte[n]

mov rsi, 1

xor rbx, rbx   ;use rbx to store sum


loop_start:
  ; sum 1 to n
  add rbx, rsi
  
  add rsi, 1
  dec rcx ; move to the next iteration
  jnz loop_start
  
; square the sum
imul rbx, rbx

mov eax, 60         ; sys_exit system call number
mov edi, 0          ; exit code 0 (success)
syscall             ; call the kernel to exit
  
  
  

