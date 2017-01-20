.globl fibonacci

fibonacci:
	addi $sp, $sp, -12	#making room on stack
	sw $s0, 0($sp)
	sw $s1, 4($sp)
	sw $ra, 8($sp)
	
	beqz $a0, exit_fib	#check if equal to zero

	slti $t0, $a0, 2
	beq $t0, $0, base_fibonacci

	addi $v0, $0, 1
	j exit_fib

base_fibonacci: 
	addi $s0, $a0, 0	#fib call for (n-1)
	addi $a0, $a0, -1
	jal fibonacci

	addi $s1, $v0, 0	#fib call for (n-2)
	addi $a0, $s0, -2
	jal fibonacci

	add $v0, $s1, $v0	#add results together

exit_fib: 
	lw $s0, 0($sp)		#restore stack
	lw $s1, 4($sp)
	lw $ra, 8($sp)
	addi $sp, $sp, 12

	jr $ra
