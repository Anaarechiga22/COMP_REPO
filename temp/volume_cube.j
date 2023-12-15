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
