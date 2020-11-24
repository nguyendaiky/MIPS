.data
	in: .asciiz "Nhap so nguyen:"
	com: .asciiz "So lon hon:"
	sum: .asciiz "\nTong: "
	diff: .asciiz "\nHieu: "
	mull: .asciiz "\nTich: "
	divi: .asciiz "\nThuong: "
.text
main:
	li $v0, 4
	la $a0, in
	syscall
	li, $v0, 5
	syscall
	move $t0, $v0
	li $v0, 4
	la $a0, in
	syscall
	li $v0, 5
	syscall
	move $t1, $v0
	
	# compare
	li $v0, 4
	la $a0, com
	syscall
	slt $s0, $t1, $t0
	beq $s0, $zero, label
		li $v0, 1
		add $a0, $zero, $t0
		syscall
		j exit
	label:
		li $a0, 0
		li $v0, 1
		add $a0, $zero, $t1
	 	syscall
	 exit:
	
	# add
	li $v0, 4
	la $a0, sum
	syscall
	add $s1, $t0, $t1
	li $v0, 1
	li $a0, 0
	add, $a0, $zero, $s1
	syscall
	
	# sub
	li $v0, 4
	la $a0, diff
	syscall
	sub $s2, $t0, $t1
	li $v0, 1
	li $a0, 0
	add, $a0, $zero, $s2
	syscall
	
	# mul
	li $v0, 4
	la $a0, mull
	syscall
	mul $s3, $t0, $t1
	li $v0, 1
	li $a0, 0
	add, $a0, $zero, $s3
	syscall
	
	#div
	li $v0, 4
	la $a0, divi
	syscall
	div $s4, $t0, $t1
	li $v0, 1
	li $a0, 0
	add, $a0, $zero, $s4
	syscall
