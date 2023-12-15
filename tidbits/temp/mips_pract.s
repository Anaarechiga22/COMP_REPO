 .text
      .globl mips_pract

mips_pract: nop 

     #//$a0: 
     #//$a1: 
     #//$a2:
     #//$v0;    
     #//$t0; 32-bit integer 
     #//$t1; ? (
     #//$t2;  and $t2, $t0, $t1 // ($t2 = $t0 & $t1)
     #//$t3;  srl $t3, $t2, 8    ($t3 = $t2 >>> 8)
    

 li $t0, 0x82A620EE
 li $t1, 0x0000FF00

 and $t2, $t0, $t1 # complement of 
 srl $t3, $t2, 8


move $v0, $t3 #// $v0= $t3;

    move $v0, $v0 #// return $v0;    //return FV;
  
    jr $ra


