;sum a list of numbers 

;make a list 
;initialize the length 

;loop through the length
; add to running sum

section .data

list db 10, 20, 30, 40, 50

len db 5

section .text
global _start

_start:

movzx rcx, byte [len]

; running sum

mov rbx, 0

;index

mov rsi, 0

sum_list:
  movzx rax, byte[list + rsi]
  add rbx, rax
  inc rsi
  dec rcx
  jnz sum_list
  
mov rax, 60      ; syscall number for exit
mov rdi, 0       ; exit status code
syscall


 
