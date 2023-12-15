 .text
      .globl base64_pract

base64_pract: nop 

     #//$a0: 
     #//$a1: 
     #//$a2:
     #//$v0;    
     #//$t0; 24-bit integer 
     #//$t1; mask (
     #//$t2;  and $t2, $t0, $t1 // ($t2 = $t0 & $t1)
     #//$t3;  srl $t3, $t2, 8    ($t3 = $t2 >>> 8)
    

 li $t0, 0x32F3AA
 li $t1, 0x3F000

 and $t2, $t0, $t1 # complement of 
 srl $t3, $t2, 12 


move $v0, $t3 #// $v0= $t3;

    move $v0, $v0 #// return $v0;    //return FV;
  
    jr $ra
