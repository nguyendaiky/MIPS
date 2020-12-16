.data
	array1:	.word	5, 6, 7, 8, 1, 2, 3, 9, 10, 4
	size1:	.word	10

	array2:	.byte	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
	size2:	.word	16

	array3:	.space	8
	size3:	.word	8
	
	str:	.asciiz "Tat ca phan tu cua mang: "
	newline:.asciiz "\n"
	space:	.asciiz " "


.text 
	li $v0, 4
	la $a0, str
	syscall
	#print array2
	li $t0, 0 #index
	lw $t1, size1 #length of array1
	
loop_a1:
	slt $t6, $t0, $t1 #if i < n 
	beq $t6, 0, exit1 #exit loop
	sll $t2, $t0, 2
	
	lw  $a0, array1($t2) #load word array1(offset) to $a0
	li $v0, 1
	syscall
	la $a0, space
	li $v0, 4
	syscall
	
	addi $t0, $t0, 1 #i++
	j loop_a1
exit1:	la $a0, newline
	li $v0, 4
	syscall
	
	la $a0, str
	li $v0, 4
	syscall
	#print array2
	li $t0, 0 #index 
	lw $t1, size2 #length of array2
	
loop_a2:
	slt $t6, $t0, $t1
	beq $t6, 0, exit2
	
	lb $a0, array2($t0)
	li $v0, 1
	syscall
	la $a0, space
	li $v0, 4
	syscall
	
	addi $t0, $t0, 1 #i++
	j loop_a2
exit2:
	
	

