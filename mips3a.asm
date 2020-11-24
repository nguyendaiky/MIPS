.data
	character: .word 1
	out: .asciiz "\nNhap ky tu (chi 1 ky tu):"
	out1: .asciiz "\nKy tu truoc:"
	out2: .asciiz "\nKy tu sau:"
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
		
