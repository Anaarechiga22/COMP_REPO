# COMP122 Lecture Notes: October 23, 2023

## Announcements:
   1. Assigment 24-bitwise-operations graded.
   1. Assigment 42-checksum graded.
      - Noted Items:
        1. large number of students (18) did not attempt
        1. scores greater than 90: 33 == 42%
        1. not following the process
           - Java --> Java Tac --> MIPS
        1. readability of code
           - direct correlation between   "working code <- and -> readable code"
           - check your tab versus spaces setting.

   1. Assignment 25-binary to be released.
      https://github.com/COMP122/binary-addition/blob/main/assignment.md

## Today's Agenda:
   1. Review from 10/25/2023

   1. Strings and Arrays

   1. [String Processing](https://docs.google.com/presentation/d/1fg9BuWtyZ9PARK0gDE5ZcbjOiudRSrVP2s1iuSIDYXw/edit#slide=id.g199d0a137fe_0_29)


   1. Macros for ASCII Chars (https://www.javatpoint.com/java-string-touppercase)

   1. Conversion ASCII -> Binary


## Questions from Last Lecture/Lab, etc.:
   * M/W @ 9:00 am

   * T/R @ 9:00 am


---
# Today's Lecture Material
  1. Arrays

  1. [String Processing](https://docs.google.com/presentation/d/1fg9BuWtyZ9PARK0gDE5ZcbjOiudRSrVP2s1iuSIDYXw/edit#slide=id.g199d0a137fe_0_29)


  1. String Processing

  1. Java Strings: three independent types
     1. A string is an object that contains an array of characters
     1. A string is an constant array of characters 
     1. A char[] is a fixed sized array of characters

     ```java
      String O = new String( "A string!"); // An object
      String S = "A string!";              // A constant array (+ stuff?)
      char[] A = S.toCharArray();          // An array 
      
      int l    = A.length;                 // A property: Computed or Stored?
      ```

   1. Generalized Structure of a String:
      - See the Drawing on the Board!


   1. MIPS Declaration of a String
      ```mips
             .data
      A:     .ascii "A str
      B:     .ascii "ing!"
             .asciiz "\n"
             .text
      ```


   1. Java: A.length  versus  C: strlen()
      - man strlen
      - man -k string | grep ^str

      ```java

      for(i=0; A[i]!='\0'; i++);
      
      return i;

      ```

   1. Array Indexing
      - x = A[imm]
        - load the address of A into a register
          - `la $t0, A`
        - "load" "byte" into the register
           - lbu x, imm($t0)
      - x = A[i]
        - load the address of A into a register
          - `la $t0, A`
        - modify the address to be A[i]'s address
          - add $t0, $t0, i
        - "load" "byte" into the register
           - lbu x, imm($t0)


   
   | TAC String Equations          | MIPS Instruction          |
   |-------------------------------|---------------------------|
   | `x = A[imm];`                 | `la p, A`                 |
   |                               | `lbu x, imm(p)`           |
   |                               |                           |
   | `x = A[v];`                   | `la p, A`                 |
   |                               | `add p, p, v`             |
   |                               | `lbu x, 0(p)`             |
   |                               |                           |
   | `A[imm] = x;`                 | `la p, A`                 |
   |                               | `sb x, imm(p)`            |
   |                               |                           |
   | `A[v] = x;`                   | `la p, A`                 |
   |                               | `add p, p, v`             |
   |                               | `sb x, 0(p)`              |
   |                               |                           |
   | `p = & A;`                    | `la p, A`                 |
   | `x = (* p);`                  | `lbu x, 0(p)`             |
   | `(* p) = x;`                  | `sb x, 0(p)`              |

  
 

  1. Practicum:  strchr()
     - Prototype: `char[] strchr(char[] A, int c);`
     - Description: locate a char in a string

  ```java
     match:  for(i=0; A[i]!='\0'; i++) {
               if (A[i] == c) {
                 break match;
               }
             }

  ```

                   

  ```java TAC
init:  i =0;
   $l = A[i];
   $r = '\0';
match: for (; $l != $r ;) {           // for(i=0; A[i]!='\0'; i++) {
      
        if ($lr == c){                //        if (A[i] == c) {
          break match;                //          break match;
            }                         //        }
            nop                       //      }
            i ++;                     // 
            $l = A[i];
            $r = '\0';
            contiue match;
         }
for_done:                             // ;
  ```

  ``` mips
# A : $a0         
# c : $a1
# A : $t0
# c : $t1
# i : $t2
# $l : $t3
# $r : $t4
# p : $t5 (&A)
# demarshal args
move $t0, $ao
move $t1, $a1

 init: li $t2, 0                          ##  init:  i =0;
       la $t5, A                          ##   $l = A[i];
       addi $t5, $t5, $t2
       lbu $t3, 0($t5)
       li $t4, '\0'                       ##   $r = '\0';
 match: beq $t3, $t4, for_done            ## match: for (; $l != $r ;) {     
         beq $t3,$t1, for_done                                 ##      
           beq $t3,$t1, for_done          ## bne $t3, $t1, if_done             ##  if ($lr == c){          
          inc($t2)                        ##    b for_done                     ## break match;          
                                          ##     b if_done                     ##            }                   
                                          ##            nop                 
                                          ##            i ++;               
        la $t5, A                         ##            $l = A[i];
        addi $t5, $t5, $t2                ##            $r = '\0';
        lbu $t3, 0($t5)                   ##            contiue match;
         b match                          ##         }
for_done:  nop                            ## for_done:                       

  ```

 
   1. Macros: for ASCII https://www.javatpoint.com/post/java-character
      - isLowerCase (testing to see if letter is big or small)
      ``` java
         public statuc int isLowerCase(char c){
            if ('a' <= c && c <= 'z') return 0;
            return 1;
         }
      ```
      - isUpperCase

      - isDigit
      - isLetter
      - toUpperCase
      ```java 
         public static int toUpperCase(char c){

            return c - 'a' +'A';


         }
      ```
      - toLowerCase

   1. Conversion ASCII -> Binary
      - man atoi
      - isHexDigit()
      ``` java
         public static int isHexDigit(char x) {
            switch (x) {
         case '0' .. '9' : return 0;
         case 'a' .. 'f' : return 0;
         case 'A' .. 'F' : return 0;
}
return 1;
         
   }



      ```




---
## Resources

      | TAC String Equations          | MIPS Instruction          |
      |-------------------------------|---------------------------|
      | `x = A[imm];`                 | `la p, A`                 |
      |                               | `lb x, imm(p)`            |
      |                               |                           |
      | `x = A[v];`                   | `la p, A`                 |
      |                               | `add p, p, v`             |
      |                               | `lb x, 0(p)`              |
      |                               |                           |
      | `A[imm] = x;`                 | `la p, A`                 |
      |                               | `sb x, imm(p)`            |
      |                               |                           |
      | `A[v] = x;`                   | `la p, A`                 |
      |                               |                           |
      |                               | `add p, p, v`             |
      |                               | `sb x, 0(a)`              |
      |                               |                           |
      | `x = & A;`                    | `la x, A`                 |
      | `x = (* p);`                  | `lb x, 0(p)`              |
      | `(* p) = x;`                  | `sb x, 0(p)`              |


---
<!-- This section for student's to place their own notes. -->
<!-- This section will not be updated by the Professor.   -->

## Notes  

line 52-56: 0 is a null character 
at least four segemnts for data (memory). data text stack heap

line 75- 81: changeing to TAC 
``` java tac
init:  ;
      i=0;
      $l = A[i];
      $r = '\0';
loop:  for (; $l != $r;) {
body:  ;

next:  ;
         i = i + 1;
         $l = A[i];
         $r = '\0';     // Note this is a constant assignment 
         continue loop;
       }
 done: ;
       return i;




```

``` mips
# A  : t0
# i  : t1
# $l : t2
# $r : t3

move $t0, $a0     # demarshal my input args



init: nop                           #  ;
      li $t1, 0                     # i=0;
      la $t2, A                     # $l = A[i];
      lbu
      add $t2, $t2, 4t1                  
      li $t3, '\0'                  # $r = '\0';
loop: beq $t2, $t3, done                   #  for (; $l != $r;) {
body:    nop                        #  ;
                                    # 
next:    nop                        #  ;
         add $t1, $t1, 1            #    i = i + 1;
         la $t2, A                  #    $l = A[i];
         add $t2 , $T2, $t1         #    $r = '\0';     // Note this is a constant assignment 
         lbu 
         li $t3, '\0'               #    continue loop;
      b loop
                                    #  }
 done: nop                          #  ;
       move $v0, $t1                #  return i;
       jr $ra

```

