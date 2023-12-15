		.text
   		.globl volume_cube

volume_cube:	nop				## public static int volume_cube(int $a0){
		
   		# a0: s = length / width / height of the cube
		# t0: 
   		# t1:
   		# v0:  V = s^3
   												 
		mult $a0, $a0,     # $t0 = $a0 * $a0;    // s= (l * w) 
		mflo $t0    

    	mult $t0, $a0	   # $t1 = $t0 * $a0;    // s= (l * w) * h
    	mflo $t1

    	move $v0, $t1	   # $v0 = $t1;          // V = s^3

		move $v0, $v0			# return $v0;
		jr $ra
