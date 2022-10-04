.data
message: .asciiz "Hello World!"
new_line: .asciiz "\n"
.text

main:

	# create a counter in register $t0
	li $t0, 0

	# loop ten times alternating between printing
	# "Hello World!" and a newline
loop:
	beq $t0, 10, end
	jal print_message
	jal print_new_line
	addi $t0, $t0, 1
	j loop

end:

	# Exit the program
	li $v0, 10
	syscall


    # A procdure to print the message string
	print_message:
		la $a0, message
		li $v0, 4
		syscall
		jr $ra

	# A procedure to pring a new line
	print_new_line:
		la $a0, new_line
		li $v0, 4
		syscall
		jr $ra