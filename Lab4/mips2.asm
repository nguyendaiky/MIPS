.text 
main:
	li $s2, 0	#Sum
	li $s0, 1	#i
	 
	li $v0, 5	#N
	syscall 
	move $s1, $v0 
	
for:
	slt $t0, $s1, $s0	#check if N < i 
	bne $t0, $0, end 	#if wrong (means i <= N)
	add $s2, $s2, $s0 	#j = i + 1
	addi $s0, $s0, 1 	# loop
	j for 
	
end: