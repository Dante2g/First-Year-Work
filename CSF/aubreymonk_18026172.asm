
la $a0, string1 #Load string1 into $a0.
li $v0, 4 #Load (immediate) 4 into register $v0, used for syscall service 4 (print string).
syscall #Run service 4 (print string).

li $v0, 8 #Load (immediate) 8 into register $v0, used for syscall service 8 (read string).
li $a1, 30 #Set maximum number of chars to read to 30.
syscall #Run service 8 (read string).
move $t1, $a0 #Load/move inputted string into $t1.
	
la $a0, string3 #Load string3 into $a0.
li $v0, 4 #Load (immediate) 4 into register $v0, used for syscall service 4 (print string).
syscall #Run service 4 (print string).
	
li $v0, 5 #Load (immediate) 5 into register $v0, used for syscall service 5 (read integer).
syscall #Run service 5 (read integer).
move $t2, $v0 #Store read integer in t2.
	
la $a0, string2 #Load string2 into $a0.
li $v0, 4 #Load (immediate) 4 into register $v0, used for syscall service 4 (print string).
syscall #Runs service 4 (print string).
	
move $a0, $t1 #Load/Move $t1 (inputted string) into $a0.
li $v0, 4 #Load (immediate) 4 into register $v0, used for syscall service 4 (print string).
syscall #Runs service 4 (print string).
	
la $a0, string4 #Load string4 into $a0.
li $v0, 4 #Load (immediate) 4 into register $v0, used for syscall service 4 (print string).
syscall #Run service 4 (print string).
	
li $v0, 1 #Load (immediate) 1 into register $v0, used for syscall service 1 (print integer).
move $a0, $t2 #Load/Move inputted integer from earlier into $a0 from $t2.
syscall #Run service1 (print integer).
	
.data
	string1: .asciiz "Enter name: " #Define string1.
	string2: .asciiz "Your name:\n" #Define string2.
	string3: .asciiz "Enter ID number: " #Define string3.
	string4: .asciiz "Your ID number:\n" #Define string4.
.text