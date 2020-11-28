.data
	character: .word 1
	out: .asciiz "\nNhap ky tu (chi 1 ky tu):"
	out1: .asciiz "\nKy tu truoc:"
	out2: .asciiz "\nKy tu sau:"
	out_else: .asciiz "\ninvalid type"
.text

main:

	#nhap ky tu
	li $v0, 4
	la $a0, out
	syscall
	li $v0, 8
	la $a0, character
	la $a1, 2
	syscall
	move $t0, $a0
	
	lw $s0, 0($a0)
	li $s1, 47
	slt $s1, $s1, $s0
	li $s2, 58
	slt $s2, $s0, $s2
	and $s3, $s1, $s2
	li $s1, 64
	slt $s1, $s1, $s0
	li $s2, 91
	slt $s2, $s0, $s2
	and $s4, $s1, $s2
	li $s1, 96
	slt $s1, $s1, $s0
	li $s2, 123
	slt $s2, $s0, $s2
	and $s5, $s1, $s2
	or $s6, $s3, $s4
	or $s6, $s6, $s5
	
	beq $s6, $zero, else
	
	# xuat ra ki tu truoc
	
	lw $t1, 0($t0)
	sub $t1, $t1, 1
	addi $t2, $t1, 2
		# Xuat ki tu lien truoc
		li $v0, 4
		la $a0, out1
		syscall
		sw $t1, 0($t0)
		move $a0, $t0
		syscall
		
		# Xuat ky tu lien sau
		li $v0, 4
		la $a0, out2
		syscall
		sw $t2, 0($t0)
		move $a0, $t0
		syscall
		
	j exit
	
	else:
	li $v0, 4
	la $a0, out_else
	syscall
	
exit:
