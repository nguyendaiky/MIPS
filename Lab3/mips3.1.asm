.data 
	inStr: .space 30
	enString: .asciiz "Nhap:"
	outString: .asciiz "\nXuat:"
.text 
	li $v0,4
	la $a0,enString
	syscall
	
	li $v0,8
	la $a0, inStr
	li $a1, 30
	move $t0, $a0
	syscall
	
	li $v0,4
	la $a0,outString
	syscall
	
	la $a0, inStr
	move $a0, $t0
	li $v0, 4 
	syscall
		
	li $v0, 10
	syscall