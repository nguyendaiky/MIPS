	.data
var1: .float 10.0
var2: .float 5.0

	.text 
__start:
	lw $t1, var1 
	lw $t2, var2 
	add $t3, $t1, $t2
	addi $t4, $t1, 10
	addu $t5, $t1, $t2 
	addiu $t6, $t1, 10
	sub $t7, $t1, $t2 
	subu $t8, $t1, $t2 
	and $t9, $t1, $t2 
	and $t0, $t1, 100 
	or $s0, $t1, $t2 
	nor $s1, $t1, $t2 
	sw $s2, 4($t2)
	slt $s3, $t1, $t2 
	slti $s4, $t1, 100
	sltu $s5, $t1, $t2
	sltiu $s6, $t1, 100 
	
	
	
	
