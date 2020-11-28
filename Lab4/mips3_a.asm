.data 
string1:	.asciiz "\nNhap mot ki tu: "
string2:	.asciiz "\nKi tu truoc: "
string3:	.asciiz "\nKi tu sau: "
string4:	.asciiz "\ninvalid type"

.text 
Nhap:
	li $v0, 4
	la $a0, string1
	syscall
	li $v0, 12
	syscall 
	move $t1, $v0
	
Check: 
	li $t2, 58
	li $t3, 47
	slt $t0, $t3, $t1
	beq $t0, 1, And1
re1:	li $t2, 64 
	li $t3, 91
	slt $t0, $t2, $t1
	beq $t0, 1, And2
re2:	li $t2, 96
	li $t3, 123 
	slt $t0, $t2, $t1
	beq $t0, 1, And3
re3: 	li $v0, 4
	la $a0, string4 
	syscall 
	j End
	
And1:	slt $t4, $t1, $t2
	beq $t4, 1, Print
	j re1
	
And2:	slt $t4, $t1, $t3
	beq $t4, 1, Print
	j re2

And3:	slt $t4, $t1, $t3
	beq $t4, 1, Print
	j re3 

Print: 
	li $v0, 11
	move $a0, $t1
	syscall
	
End: 
# a0 a1 a2 a3 luu tham so
# jal nhay toi cho $ra tu dong luu dia chi nhay ve
# luu gia tri tra ve $v0, $v1 
# muon dua vao nhieu parameter hoac return ve nhieu gia tri thi su dung array 
	
	
	
	