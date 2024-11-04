.data
promptFirst: .asciiz "Enter first integer: "     # Prompt for first integer
promptSecond: .asciiz "Enter second integer: "    # Prompt for second integer
same_msg: .asciiz "User inputs are the same\n"  # Message if inputs are the same
diff_msg: .asciiz "User inputs are different\n" # Message if inputs are different
newline: .asciiz "\n"
first_output: .asciiz "First integer: "          # Message before printing first integer
second_output: .asciiz "Second integer: "        # Message before printing second integer
addition_output: .asciiz "Result of addition: "   # Message before printing addition result
subtraction_output: .asciiz "Result of subtraction: " # Message before printing subtraction result
multiplication_output: .asciiz "Result of multiplication: " # Message before printing multiplication result
division_output: .asciiz "Result of division: "   # Message before printing division result

.text
main:
	# Task 1: User Input and Output
    
	# syscall for printing string
	li $v0, 4                 
	# load address of promptFirst  
    	la $a0, promptFirst          
   	# print promptFirst    
    	syscall 
                    
    	# read integer into $v0     
    	li $v0, 5                    
    	syscall 
    
    	# store first input in $s0                     
    	move $s0, $v0                



    	# add newline
    	li $v0, 4                   
    	la $a0, newline           
    	syscall 


    	# syscall for printing string
    	li $v0, 4                    
    	# load address of promptSecond
    	la $a0, promptSecond             
    	# print promptSecond
    	syscall       
                   
    	# read integer into $v0
    	li $v0, 5                    
    	syscall   
                       
    	# store first input in $s1
    	move $s1, $v0                


	# add newline
    	li $v0, 4                   
    	la $a0, newline           
    	syscall 


    	# Output the user inputs
    	# Print first integer message
    	li $v0, 4                 
    	la $a0, first_output      
    	syscall                   

    	# 1 is the code for printing an integer
    	li $v0, 1   
    	# move $s0 to $a0 for printing                 
    	move $a0, $s0      
    	# print first integer          
    	syscall  

    	# add newline
    	li $v0, 4                   
    	la $a0, newline           
    	syscall                                   

    	# Print second integer message
    	li $v0, 4                 
    	la $a0, second_output      
    	syscall                   

    	li $v0, 1             
    	# move $s1 to $a0 for printing       
    	move $a0, $s1               
    	# print second integer 
    	syscall                      


    	# Task 2: Arithmetic Operation Practice
    	# Addition
    	# $t0 = $s0 + $s1
    	add $t0, $s0, $s1 
    	# Print addition result message
    	li $v0, 4                 
    	la $a0, addition_output     
    	syscall                   

    	# 1 is the code for the integer print syscall           
    	li $v0, 1     
    	# move result to argument register for the print syscall               
    	move $a0, $t0
    	# print result of addition                
    	syscall


    	# Subtraction
    	# $t1 = $s0 - $s1
    	sub $t1, $s0, $s1  
    	# Print subtraction result message
    	li $v0, 4                 
    	la $a0, subtraction_output     
    	syscall                   

    	# 1 is the code for the integer print syscall          
    	li $v0, 1     
    	# move result to argument register for the print syscall               
    	move $a0, $t1                
    	# print result of subtraction
    	syscall


    	# Multiplication
    	# $t2 = $s0 * $s1
    	mul $t2, $s0, $s1         
    	# Print multiplication result message
    	li $v0, 4                 
    	la $a0, multiplication_output     
    	syscall                   

    	# 1 is the code for the integer print syscall    
    	li $v0, 1                    
    	move $a0, $t2                
    	# print result of multiplication
    	syscall


    	# Division
    	# div instruction only takes two arguments so we are doing this one in 2 lines
    	# divides $s0 by $s1
    	div $s0, $s1        
    	# move quotient to $t3
    	# using LO cuz it stores the quotient          
    	mflo $t3                     
    	# Print division result message
    	li $v0, 4                 
    	la $a0, division_output     
    	syscall                   

    	# 1 is the code for the integer print syscall 
    	li $v0, 1                    
    	move $a0, $t3                
    	# print result of division
    	syscall


    	# Task 3: Conditions
    	# Check if the user inputs are equal
    	# beq = branch if equal
    	# if $s0 == $s1, jump to "equal" label
    	beq $s0, $s1, equal  
    	# bne = branch if not equal       
    	# if $s0 != $s1, jump to "not_equal" label 
    	bne $s0, $s1, not_equal      


equal:
    	# loads 4 into $v0, 4 is the syscall code for printing a string
    	li $v0, 4                    
    	# loads address of same_msg into $a0
    	la $a0, same_msg           
    	# print same_msg  
    	syscall        
    	# branches to end label              
    	j end                        


not_equal:
	# loads 4 into $v0, 4 is the syscall code for printing a string
    	li $v0, 4    
    	# loads address of diff_msg into $a0           
    	la $a0, diff_msg    
    	# print diff_msg         
    	syscall                     


end:
	# 10 is the syscall code for exiting a program
    	li $v0, 10   
    	# terminate program              
    	syscall
