.global _start
 	
.section .text
_start:
#your code here

	movl num, %ecx #counter
	movl num, %eax
	cmp $0x0, %eax    #(0==eax)
	jz end_HW1
	cmp $0x0, %eax    #(0-eax)
	js IF_NEG_HW1 #if(num<0) SF==0 negative
	
	
	#else: positive - like memmove
	movq $destination, %rax #holds the memory address of dest
	movq $source, %rbx  #holds the memory address of source
	
LOOP_HW1:
	movb (%rbx), %dl 
	movb %dl,(%rax)
	add $1, %rbx
	add $1, %rax

	dec %rcx
	cmp $0x0, %rcx
	je end_HW1	
	jmp LOOP_HW1
	
IF_NEG_HW1:
	mov %ecx, destination 
	
end_HW1:



