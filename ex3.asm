.global _start


.section .text
_start:
	mov $array1, %rax
	mov $array2, %rbx
	mov $mergedArray, %rdx
	mov $1, %R15 #flag if the first number in merged array
	
	
LOOP_HW1: 
	movl (%rax), %R8D
	movl (%rbx), %R9D
	
	cmp %R9D, %R8D
	jae firstArrayBigger_HW1        #if (r8 >= r9)
	movl %R9D, %R10D
	add $4, %rbx
	jmp CheckMergedArray_HW1
	
	
firstArrayBigger_HW1:
	movl %R8D, %R10D
	add $4, %rax
	jmp CheckMergedArray_HW1
	
	
CheckMergedArray_HW1:
	cmp (%edx), %R10D
	jne insertToArray_HW1
	jmp checkIfEnd_HW1
	
	
insertToArray_HW1:
	cmp $1, %R15 #if first 
	je FirstInArray_HW1
	
	add $4, %rdx
	mov %R10D, (%edx)
	jmp checkIfEnd_HW1
	
FirstInArray_HW1:
	mov $0, %R15
	mov %R10D, (%edx)



checkIfEnd_HW1:
	cmp $0, %R8D
	jne LOOP_HW1
	cmp $0, %R9D
	jne LOOP_HW1
	