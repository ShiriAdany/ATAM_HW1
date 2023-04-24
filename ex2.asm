.global _start

.section .data
	source: .byte 200,74,90
	destination: .quad 70
	num: .int 28 
	
.section .text
_start:
#your code here

	movl num, %ecx #counter
	movl num, %eax
	cmp $0x0, %eax    #(0-eax)
	js IF_NEG_HW1 #if(num<0) SF==0 negative
	
	
	#else: positive - like memmove
	movq $destination, %rax #holds the memory address of dest
	movq source, %rbx  #holds the value in source
	
LOOP_HW1:
	movb %bl,(%rax)
	shr $8, %rbx
	add $8, %rax

	dec %rcx
	cmp $0x0, %rcx
	je end_HW1	
	jmp LOOP_HW1
	
IF_NEG_HW1:
	mov %ecx, destination 
	
end_HW1:
	
	#mov $destination, %rax
	
	movq $60, %rax
	movq $0, %rdi
	syscall	


