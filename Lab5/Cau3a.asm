.data
	array: .space 50
	in: .asciiz "\nNhap so phan tu mang: "
	max: .asciiz "\nMax = "
	min: .asciiz "\nMin = "
	error: .asciiz "\nLOI vi chi so nhap vao ko thoa man!!"
	in_index: .asciiz "\nNhap vi tri index la: "
	index: .asciiz "\nVi tri cua mang tai index: "
	sum: .asciiz "\nTong cac phan tu trong mang: "
.text
main:
#start nhap mang
	li $v0, 4
	la $a0, in
	syscall
	li $v0, 5
	syscall
	move $s1, $v0
	move $a1, $v0
	la $a0, array
	jal inputarray
#end nhap mang
#Xuat gia tri lon nhat_nho nhat
	la $a0, array
	move $a1, $s1
	jal outmax_min
# In ra tong cac phan tu trong mang
	la $a0, array
	move $a1, $s1
	jal sum_array
# Nhap vao vi tri va in ra phan tu tuong ung
	li $v0, 4
	la $a0, in_index
	syscall
	li $v0, 5
	syscall
	move $a1, $v0
	la $a0, array
	jal array_index

j exit

#Cac ham (function)
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
outmax_min:
	lw $t3, 0($a0) # dung luu max
	lw $t4, 0($a0) # dung luu min
	add $t0, $zero, $a0
	sll $t1, $a1, 2
	add $t1, $a0, $t1
	while_max:
		lw $t2, 0($t0)
		#tim max
		blt $t3, $t2, if_max #day la if_else ne!!! khong co gi het a :v
		j else_max
		if_max:
			addi $t3, $t2, 0
		else_max:
		#tim min
		bgt $t4, $t2, if_min #tuong tu if_else not luon :v
		j else_min
		if_min:
			addi $t4, $t2, 0
		else_min:
		addi $t0, $t0, 4
		slt $t5, $t0, $t1
		bnez $t5, while_max
	li $v0, 4
	la $a0, max # doan nay ko dung $a0 de luu mang nua nua nen co the dung
	syscall
	li $v0, 1
	move $a0, $t3 #in max
	syscall
	li $v0, 4
	la $a0, min # doan nay ko dung $a0 de luu mang nua nua nen co the dung
	syscall
	li $v0, 1
	move $a0, $t4 # in min
	syscall
	jr $ra
array_index: #a0 la base cua mang, $a1 la chi so nguoi dung nhap vao
	sll $t0, $a1, 2
	add $t0, $a0, $t0 #$t0 la dung de end hoac la $t0 = &array[index]
	slt $t3, $a1, $s1 #$s1 da duoc luu la size cua mang
	beqz $t3, loi
	slt $t3, $a1, $zero
	bnez $t3, loi
	lw $t0, 0($t0) # chay xong thi luc nay $t0 da chua dia chi cua phan tu thu index cua mang-> lw len
	li $v0, 4
	la $a0, index
	syscall
	li $v0, 1
	move $a0, $t0
	syscall
	jr $ra
	loi:
		li $v0, 4
		la $a0, error
		syscall
		jr $ra
sum_array:
	add $t0, $zero, $a0 #t0 cho luu dia chi base array
	sll $t1, $a1, 2
	add $t1, $a0, $t1 #$t1 la dung de end hoac la $t1 = &array[size]
	li $t4, 0
	while_sum:
		lw $t2, 0($t0)
		add $t4, $t4, $t2
		addi $t0, $t0, 4
		slt $t3, $t0, $t1
		bnez $t3, while_sum
	li $v0, 4
	la $a0, sum
	syscall
	li $v0, 1
	move $a0, $t4
	syscall
	jr $ra
	
exit:
