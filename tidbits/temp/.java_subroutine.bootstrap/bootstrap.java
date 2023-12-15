class volume_cube {
   static MIPS_OS_Interface mips = new MIPS_OS_Interface();

public static int volume_cube(int $a0){
	 // v0: V= s^3
	 // a0: s = length / width / height of the cube

    
    int $t0;            // s * s
    int $t1;            // (s * s) * s
    int $v0;

    $t0 = $a0 * $a0;    // s= (l * w) 
    $t1 = $t0 * $a0;    // s= (l * w) * h
       
    $v0 = $t1;          // "V = s^3"
    return $v0;         
  }  

  public static void main(String[] args) {
  
    int index;
    int  $a0   = 4;

    int $v0 = volume_cube($a0);

    // Augment this code based upon desired output type

    mips.print_ci('\n');   // Print extra '\n' in case the users
                           // last line does not include the 
                           // proforma '\n'.
    mips.print_d($v0);
    mips.print_ci('\n');
    return;
  }
}
