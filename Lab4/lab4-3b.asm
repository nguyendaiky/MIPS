.data
	zero:	.asciiz "Zero "
	one:	.asciiz "One "
	two:	.asciiz "Two "
	three:	.asciiz "Three "
	four:	.asciiz "Four "
	five:	.asciiz "Five "
	six:	.asciiz "Six "
	seven:	.asciiz "Seven "
	eight:	.asciiz "Eight "
	nine:	.asciiz "Nine "
	
	str:	.asciiz "Nhap so: "
	error:	.asciiz "Invalid Entry"
	error2:	.asciiz "Number of digit is less or equal 3!"
	
.text		
main:	#input integer
	li $v0, 4
	la $a0, str
	syscall
	li $v0, 5
	syscall
	move $t1, $v0
	
	#check positive integer
	li $t0, 0
	slt $t2, $t1, $t0
	beq $t2, 1, PrintError1
	
	#check number of digit
	li $t2, 0
	addi $t3, $t1, 0
loop:	beq $t3, 0, finish_loop
	div $t3, $t3, 10
	addi $t2, $t2, 1
	j loop
finish_loop:
	li $t7, 3
	slt $t6, $t7, $t2
	beq $t6, 1, PrintError2
	
	#plit digit and print integer
plit:	div $t1, $t1, 10
	mfhi $s1
	div $t1, $t1, 10
	mfhi $s2
	div $t1, $t1, 10
	mfhi $s3
	
	#print integer
	beq $t2, 1, OneDigit
	beq $t2, 2, TwoDigit
	addi $a1, $s3, 0
	jal PrintNumber
TwoDigit:
	addi $a1, $s2, 0
	jal PrintNumber
OneDigit:
	addi $a1, $s1, 0
	jal PrintNumber
	j Exit
	
	#Function
PrintError1:
	li $v0, 4
	la $a0, error
	syscall
	j Exit
	
PrintError2:
	li $v0, 4
	la $a0, error2
	syscall
	j Exit 
	
PrintNumber:
	li $v0, 4
	beq $a1, 0, Printzero
	beq $a1, 1, Printone
	beq $a1, 2, Printtwo
	beq $a1, 3, Printthree
	beq $a1, 4, Printfour
	beq $a1, 5, Printfive
	beq $a1, 6, Printsix
	beq $a1, 7, Printseven
	beq $a1, 8, Printeight
	beq $a1, 9, Printnine
	Printzero:
		la $a0, zero
		syscall
		j out
	Printone:
		la $a0, one
		syscall
		j out
	Printtwo:
		la $a0, two
		syscall
		j out
	Printthree:
		la $a0, three
		syscall
		j out
	Printfour:
		la $a0, four 
		syscall
		j out
	Printfive:
		la $a0, five
		syscall
		j out
	Printsix:
		la $a0, six
		syscall
		j out
	Printseven:
		la $a0, seven 
		syscall
		j out
	Printeight:
		la $a0, eight
		syscall
		j out
	Printnine:
		la $a0, nine
		syscall
		j out
	out:	jr $ra 
			
Exit:
