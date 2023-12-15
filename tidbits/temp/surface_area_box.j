	.text
		.globl surface_area_box

surface_area_box: nop	## public static int surface_area_box(int $a0, int $a1, int $a2){
							


		#  v0 : // S
		#  a0 : // l
		#  a1 : // w
		#  a2 : // h 
	

	mult $a0, $a1				#// $t0 = $a0 * $a1;
	mflo $t0
	
	mult $a0, $a2				#// $t1 = $a0 * $a2;
	mflo $t1

	mult $a2, $a1				#// $t2 = $a2 * $a1;
	mflo $t2			
	
	add $t3, $t0, $t0				#// $t3 = 2 * $t0;

	add $t4, $t1, $t1				#// $t4 = 2 * $t1;

	add $t5, $t2, $t2				#// $t5 = 2 * $t2;				

	add $t6, $t3, $t4				#// $t6 = $t3 + $t4;			

	add $t7, $t6, $t5				#// $t7 = $t6 + $t5;

		move $v0,$t7              #// $v0 = $t7;

   		move $v0, $v0			# return $v0; 
   		jr $ra 
