la $a0, string1 #Load string1 into $a0.
li $v0, 4 #Load (immediate) 4 into register $v0, used for syscall service 4 (print string).
syscall #Run service 4 (print string).

li $v0, 5 #Load (immediate) 5 into register $v0, used for syscall service 5 (read integer).
syscall #Run service 5 (read integer).
move $t1, $v0 #Store/Move inputted integer in $t1.

li $t0, 2 #Loads 2 into $t0.
div $t1, $t0 #Divide $t1 (input) by $t0 (stored value of 2).
mflo $t2 #Set $t2 to contents of lo (quotient)

la $a0, string2 #Load string2 into $a0.
li $v0, 4 #Load (immediate) 4 into register $v0, used for syscall service 4 (print string).
syscall #Run service 4 (print string).

li $v0, 1 #Load (immediate) 1 into register $v0, used for syscall service 1 (print integer).
move $a0, $t2 #Load/Move inputted integer from earlier into $a0 from $t2.
syscall #Run service 1 (print integer).

.data
	string1: .asciiz "Enter the last two digits of your student ID number: "
	string2: .asciiz "Output: "
.text