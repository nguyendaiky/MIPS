.data
	arrayA: .space 20
	arrayB: .space 20
	inA: .asciiz "\nNhap so phan tu cua mang A: "
	inB: .asciiz "\nNhap so phan tu cua mang B: "
.text
main:
	#nhap mang A
	li $v0, 4
	la $a0, inA
	syscall
	li $v0, 5
	syscall
	move $a1, $v0
	la $a0, arrayA
	jal inputarray
	#nhap mang B
	li $v0, 4
	la $a0, inB
	syscall
	li $v0, 5
	syscall
	move $a1, $v0
	la $a0, arrayB
	jal inputarray
	# luu address cua cac mang vao thanh gi theo yeu cau
	la $s1, arrayA
	la $s2, arrayB
	li $s0, 2 #trong de for chay bat dau voi i = 2
	# $s0 da chua i, $s1, $s2 lan luot chua base address cua A, B
	# Bay h la giai quyet chuyen cau lenh C trong de sang MIPS
	loop:
		sll $t0, $s0, 2
		add $t0, $s1, $t0 #L?y &A[i]
		addi $t1, $t0, 0 # lay $t1 = $t0 = A[i]
		lw $t1, -8($t1) # lay A[i - 2]
		sll $t3, $t1, 2
		add $t3, $s2, $t3 # &B[A[i - 2]]
		lw $t3, 0($t3) # B[A[i - 2]]
		sw $t3, 0($t0)
		addi $s0, $s0, 1
		slti $t4, $s0, 10
		bnez $t4, loop
	
j exit
inputarray: #copy tu bai truoc thoi =))))))))))
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
