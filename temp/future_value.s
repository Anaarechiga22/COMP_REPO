      .text
      .globl future_value

future_value: nop  ## public static int future_value(int $a0, int $a1, int $a2 )


     #//$a0: I
     #//$a1: R
     #//$a2: T

     #// int $v0;    //int FV;
     #// int $t0;
     #// int $t1;
     #// int $t2;
     #// int $t3;
     #// 100
                       # //FV = I * ( 100 + ( R * T )) / 100;
li $t4, 100

   mult $a1, $a2      #// $t0 = $a1 * $a2;   // R * T
   mflo $t0

   add $t1, $t4, $t0  #// $t1 = 100 + $t0;   // 100 ( R * T)


     mult $a0, $t1    #// $t2 = $a0 * $t1;   // I (100( R * T ))
     mflo $t2

    div $t2, $t4 #// $t3 = $t2 / 100;  // (I (100 (R * T ))/100)
     mflo $t3

    move $v0, $t3 #// $v0= $t3;

    move $v0, $v0 #// return $v0;    //return FV;
    jr $ra
  
