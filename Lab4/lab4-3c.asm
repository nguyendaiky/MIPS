.data
	in1: .asciiz "Nhap so nguyen thu nhat vao: "
	in2: .asciiz "Nhap so nguyen thu hai vao: "
	out: .asciiz "So lon hon la: "
	sum: .asciiz "Tong: "
	dif: .asciiz "Hieu: "
	multi: .asciiz "Tich: "
	divi: .asciiz "Thuong "
	newline:.asciiz "\n"
	
.text
main:	#input 2 integer
	li $v0, 4
	la $a0, in1
	syscall 
	li $v0, 5
	syscall
	move $t0, $v0
	li $v0, 4 
	la $a0, in2
	syscall 
	li $v0, 5
	syscall
	move $t1, $v0
	
	#Compare 2 integer
	li $v0, 4 
	la $a0, out 
	syscall 
	li $v0, 1
	slt $t2, $t0, $t1
	beq $t2, 1, out0
	move $a0, $t0
	j out1
out0:
	move $a0, $t1
out1:
	syscall
	li $v0, 4
	la $a0, newline
	syscall
	
	#Sum, dif, mul, div
	#Sum
	add $t3, $t0, $t1
	li $v0, 4
	la $a0, sum
	syscall
	li $v0, 1
	move $a0, $t3
	syscall
	li $v0, 4
	la $a0, newline
	syscall
	
	#Dif
	sub $t4, $t0, $t1
	li $v0, 4
	la $a0, dif
	syscall
	li $v0, 1
	move $a0, $t4
	syscall
	li $v0, 4
	la $a0, newline
	syscall
	
	#Mul
	mul $t5, $t0, $t1
	li $v0, 4
	la $a0, multi
	syscall
	li $v0, 1
	move $a0, $t5
	syscall
	li $v0, 4
	la $a0, newline
	syscall
	
	#Div
	div $t6, $t0, $t1
	li $v0, 4
	la $a0, divi
	syscall
	li $v0, 1
	move $a0, $t6
	syscall

	
