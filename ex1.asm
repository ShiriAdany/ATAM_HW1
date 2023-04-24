.global _start

#.section .data

#num: .quad 0xffffffffffffffff
#Bool: .byte 1

.section .text
_start:
#your code here

	movq num, %rax
	xor %bl, %bl #counter
	movq $65, %rcx 
	
loop_HW1:
	dec %rcx
	cmp $0x0, %rcx
	je end_HW1
	
	sar %rax
	jae loop_HW1 #if CF==0
	inc %bl
	jmp loop_HW1
	

end_HW1:
	movb %bl, Bool
	

  #movq $60, %rax
  #movq $0, %rdi
  #syscall
	