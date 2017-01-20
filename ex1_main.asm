# =============================================================
# main PROCEDURE WRITING WORKSHEET
#
# Declare all global variables first
#
# Write the code for the body of this procedure first,
#   without worrying much about saving/restoring values
#   on/from the stack
#
# Which registers out of $t0-$t9, $a0-$a3, and $v0-$v1 must
#   be protected from a call to a callee?
#
# Which local variables are needed to be created?
#
# What is the max number of arguments this procedure will need
#   for calling *any* callee?
#
# Now, complete your code using the template below
#
# =============================================================

.data 0x0
	newLine: .asciiz "\n"

# global variables here


.text 0x3000
.globl main

main:

ori     $sp, $0, 0x2ffc     # Initialize stack pointer to the top word below .text
                            # The first value on stack will actually go at 0x2ff8
                            #   because $sp is decremented first.
addi    $fp, $sp, -4        # Set $fp to the start of main's stack frame

loop:
	ori $v0, $0, 5		#read input
	syscall
	
	or $a0, $v0, $0
	addi $t3, $0, 2
	sge $t4, $a0, $t3
	sub $a0, $a0, $t4
	
	jal fibonacci		#call fibonacci
	add $a0, $0, $v0
	ori $t6, $a0, 0
	ori $v0, $0, 1
	syscall
	
	la $a0, newLine		#add newLine char
	ori $v0, $0, 4
	syscall
	
	beq $t6, $0, exit_from_main
	
	j loop


exit_from_main:
ori     $v0, $0, 10     # System call code 10 for exit
syscall                 # Exit the program
end_of_main:
