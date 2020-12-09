.data
	array1:	.word	5, 6, 7, 8, 1, 2, 3, 9, 10, 4
	size1:	.word	10

	array2:	.byte	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
	size2:	.word	16

	array3:	.space	8
	size3:	.word	8
	
	str:	.asciiz "Tat ca phan tu cua mang: "
	str1:	.asciiz "\n"


.text 
	li $v0, 4
	la $a0, str
	syscall
	#setup for loop array1
	li $t0, 0 #index
	la $t1, size1 #length array1
	la $t1, array1 #load address array[0] to $t1
	
loop_a1:slt $t6, $t0, $t1 #if i < n 
	beq $t6, 0, exit1 #exit loop
	sll $t2
	lw  $a0, ($t1) #print array[i]
	li $v0, 1
	syscall
	
	addi $t0, $t0, 1 #i++
	j loop_a1

exit1:
