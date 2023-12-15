# This file provides a template for a MIPS subroutine
# This template presume that 
#   - a frame is not necessary
#   - all arguments are staged in registers (a0..a3, v0, v1)
#   - registers can be saved/restored via push/pop


        .text
        .globl {subroutine_name}

        # Include any supporting files, such as macros
        #.include ""

        .data
        # Insert an Static Data Declarations

        .text

{subroutine_name}: nop             # {prototype}

        # Register Allocation Notes
        # a0: 
        # a1: 
        # a2: 
        # a3: 
        # v0: 
        # v1: 

        # t0:
        # t1:
        # t2:
        # t3:
        # t4:
        # t5:
        # t6:
        # t7:
        # t8:
        # t9:

        # s0:
        # s1:
        # s2:
        # s3:
        # s4:
        # s5:
        # s6:
        # s7:

        ####################################################
        # Subroutine Setup
                                # Build the Frame
        push_s_registers()      # Save the "S" registers        
        move $t0, $a0           # Demarshal input arguments
        move $t1, $a1
        move $t2, $a2
        move $t3, $a3


        # Example of a Subroutine Invocation
        ####################################################
        # The Pre-call
        move $a0, {arg1}         # Marshal actual arguements
        move $a1, {arg2}         
        move $a2, {arg3}         
        push_t_registers()      # Save T registers
        push $ra, $sp, $fp      # Save special registers
    
        # The Call
        jal {func}              # {retval} = {func}({arg1}..{arg3});
    
        # The Post-call
        pop $ra, $sp, $fp       # Restore special registers
        pop_t_registers()       # Restore T registers
        move {retval}, $v0      # Demarshal return value
        ####################################################




        ####################################################
        # Subroutine Cleanup
        move $v0, {reg}         # Marshal return value
        pop_s_registers()       # Restore S registers
                                # Delete Frame
        jr $ra                  # Return
