.data
	A: .space 50
	in: .asciiz "\nNhap so phan tu cua mang: "
	nhap_i: .asciiz "\nNhap i = "
	nhap_j: .asciiz "\nNhap j = "
.text
main:
	la $v0, 4
	la $a0, in
	syscall
	la $a0, A	
	li $v0, 5
	syscall
	move $t0, $v0 #luu size cua $t0
	move $a1, $v0
	jal inputarray
#chuyen C -> MIPS
	la $s3, A #dia chi cua A duoc luu trong $s3
	li $v0, 4
	# Cho nhap i voi j luon cho professional :v
	la $a0, nhap_i
	syscall
	li $v0, 5
	syscall
	move $s0, $v0 #i duoc luu trong $s0
	li $v0, 4
	la $a0, nhap_j
	syscall
	li $v0, 5
	syscall
	move $s1, $v0 #j duoc luu trong $s1
# chuyen code trong de bai
	sll $t1, $s0, 2
	add $t1, $t1, $s3
	slt $t2, $s0, $s1
	bnez $t2, else_if
	sw $s0, 0($t1)
	j exit
	else_if: sw $s1, 0($t1)
j exit
# Function
inputarray: #hai tham so $a0 la base array, $a1 la size cua arrray
	add $t0, $zero, $a0 #t0 cho luu dia chi base array
	sll $t1, $a1, 2
	add $t1, $a0, $t1 #$t1 la dung de end hoac la $t1 = &array[size]
	while_input:
		li $v0, 5
		syscall
		sw $v0, 0($t0)
		addi $t0, $t0, 4
		slt $t3, $t0, $t1
		bnez $t3, while_input
	jr $ra
exit:
