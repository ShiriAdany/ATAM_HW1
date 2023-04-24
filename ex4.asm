.global _start

	
.section .text
_start:

	movq head(%rip), %rax
	movq head(%rip), %rbx
	movq %rax, %R10
	movq %rax, %R11
	testq %rax, %rax
	je END_HW1
	
	
	mov $1, %rcx
	mov $1, %rdx
	
	
	#regiser R10 saves the previous node of the "value" node
	#register R11 saves the previous node of the source node
	
	
LOOP_HW1:                            #find the value and the node before value
	movl (%rax), %R8D
	cmp (Value), %R8D    #found the node
	je LOOP2_HW1
	
	movq %rax, %R10

	cmp $1, %rcx
	je firstTime1_HW1
	movq 4(%rax), %rax    #move to the next node
	testq %rax, %rax
	jne LOOP_HW1
	jmp END_HW1

firstTime1_HW1:
	movq (%rax), %rax
	dec %rcx
	testq %rax, %rax
	jne LOOP_HW1
	jmp END_HW1
	
	
LOOP2_HW1:                           #find the node behind source
	movq %rbx, %R8
	cmpq $Source, %R8    #found the node
	je Swap_HW1
	
	movq %rbx, %R11 
	
	cmp $1, %rdx
	je firstTime2_HW1
	movq 4(%rbx), %rbx    #move to the next node
	testq %rbx, %rbx
	jne LOOP2_HW1
	jmp END_HW1


firstTime2_HW1:
	movq (%rbx), %rbx
	dec %rdx
	testq %rbx, %rbx
	jne LOOP2_HW1
	jmp END_HW1
		
	
Swap_HW1:
		movq 4(%rax), %rdx                       #rdx is temp register for  holding the address of "value" next
		movq 4(%rbx), %R9						  # R9 holds the next of the "sorce" node
		
		#swapping
		
		movq %R9, 4(%rax)
		movq %rdx, 4(%rbx)
		
		
		movq %rbx, 4(%R10)    #the node behind value now points to source
		movq %rax, 4(%R11)    #the node behind source now points to value
	
END_HW1:


movq $head, %rax
  cmpq $node_0, 0(%rax)
  jne bad_exit

  movq $node_0, %rax
  cmpl $917, (%rax)
  jne bad_exit
  cmpq $node_1, 4(%rax)
  jne bad_exit

  movq $node_1, %rax
  cmpl $491, (%rax)
  jne bad_exit
  cmpq $node_2, 4(%rax)
  jne bad_exit

  movq $node_2, %rax
  cmpl $392, (%rax)
  jne bad_exit
  cmpq $node_3, 4(%rax)
  jne bad_exit

  movq $node_3, %rax
  cmpl $226, (%rax)
  jne bad_exit
  cmpq $node_7, 4(%rax)  #asdf
  jne bad_exit

  movq $node_4, %rax
  cmpl $82, (%rax)
  jne bad_exit
  cmpq $node_8, 4(%rax)   #changed here
  jne bad_exit

  movq $node_5, %rax
  cmpl $83, (%rax)
  jne bad_exit
  cmpq $node_6, 4(%rax)
  jne bad_exit

  movq $node_6, %rax
  cmpl $619, (%rax)
  jne bad_exit
  cmpq $node_4, 4(%rax)  #asdf
  jne bad_exit

  mov $node_7, %rax
  cmpl $696, (%rax)
  jne bad_exit
  cmpq $node_5, 4(%rax)   #changed here
  jne bad_exit

  movq $node_8, %rax
  cmpl $463, (%rax)
  jne bad_exit
  cmpq $node_9, 4(%rax)
  jne bad_exit

  movq $node_9, %rax
  cmpl $730, (%rax)
  jne bad_exit
  cmpq $node_10, 4(%rax)
  jne bad_exit

  movq $node_10, %rax
  cmpl $655, (%rax)
  jne bad_exit



bad_exit:
	movq $60, %rax
	movq $0, %rdi
	syscall
	



