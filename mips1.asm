.text 
main:
	li $s0, 3 
	li $s1, 2 
	
	li $t0, 5
	li $t1, 4 
	
	bne $s0, $s1, no_equal 
	add $s2, $t0, $t1 
	j end 

no_equal:
	sub $s2, $t0, $t1 
end: 