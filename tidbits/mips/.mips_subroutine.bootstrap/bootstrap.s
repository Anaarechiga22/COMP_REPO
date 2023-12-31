                .data



subroutine:     .asciiz "add4"
                # add4(2, 4, 6, 8)
                # Register Dump:   

return_value:   .word 0

                # Layout the command line arguments 
                .align 2
argc:           .word  4
argv:           .word arg_0, arg_1, arg_2, arg_3 

                .align 2
arg_0:          .word 2 # 2

                .align 2
arg_1:          .word 4 # 4

                .align 2
arg_2:          .word 6 # 6

                .align 2
arg_3:          .word 8 # 8

                .align 2
saved_sp:       .word 0
                .align 2
saved_float:    .float 1.0
                .align 3
saved_double:   .double 1.0

                .text
                .globl main

main:           nop      

                # Set the T registers to be random values
                li $t0, 16810
                li $t1, 25436
                li $t2, 12279
                li $t3, 29906
                li $t4, 5161
                li $t5, 7526
                li $t6, 3151
                li $t7, 27406
                li $t8, 6305
                li $t9, 10266

                # Set the S registers to 0xDeadBeef
                li $s0, 0xDeadBeef
                li $s1, 0xDeadBeef
                li $s2, 0xDeadBeef
                li $s3, 0xDeadBeef
                li $s4, 0xDeadBeef
                li $s5, 0xDeadBeef
                li $s6, 0xDeadBeef
                li $s7, 0xDeadBeef

                # Set the FP and GP registers
                li $fp, 0xDeadBeef
                li $gp, 0xDeadBeef

                # Save the SP registers
                sw $sp, saved_sp

                 # Marshal the input arguments into the registers
                li $a0, 2                # 2
                li $a1, 4                # 4
                li $a2, 6                # 6
                li $a3, 8                # 8

                # Marshal the remaining input arguments onto the stack
                # Make a call to the user's subroutine
                jal add4


                # If we made it here, then all registers that 
                # should have been preserved over the subroutine
                # boundary should be set to 0xDeadBeef;   
                # except $ra and $sp.

                # If we are here than set $ra to 0xDead Beef
                li $ra, 0xDeadBeef

                # If the SP value is what it was prior to the
                #   "jal add4"
                # then set it to be 0xDeadBeef
                lw $at, saved_sp
                bne $at, $sp, skip
                  li $sp, 0xDeadBeef
        skip:   nop

                # Save the return value from 
                sw $v0, return_value

                # Print a blank line after the users output
                li $a0, '\n'
                li $v0, 11
                syscall

                # Save the return value from 
                lw $v0, return_value

                # Print the integer in $v0
                move $a0, $v0
                li $v0, 1
                syscall
                
                # Exit 0
                li $v0, 10
                syscall

