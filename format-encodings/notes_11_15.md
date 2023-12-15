# COMP122 Lecture Notes: November 15, 2023


## Announcements:
   1. Issues with tags.. and being in the middle

   1. Fix you tags... before I grade 44-
      - but no new commits are valid


## Today's Agenda:
   1. Pickup where we left off on: 
      - Subroutine
        - and associated macros

   1. Practicum on Subroutine construction


## Questions from Last Lecture/Lab, etc.:
   * M/W @ 9:00 am
     - If a branch of a branch is it a copy of the previous branch
       * they share a common history

   * T/R @ 9:00 am
     - none


---
# Today's Lecture Material

  1. Subroutine
     - See Slides: assembly_programming/slide_presentation/
 

# Today's Lab Material

  1. Subroutine Construction Practicum


---
## Resources


---
<!-- This section for student's to place their own notes. -->
<!-- This section will not be updated by the Professor.   -->

## Notes  
notes for notes_11_15.md
sp points to the bottom part of the frame which is the top of the stack. sp the end of frame fp start of frame
slides: subroutine_constrcution
 
 slide 10: region in memory, specificy a stack, in which it contains the formal and local variables for a subroutine.
           client is going to ask the subroutine for somthing and the producer is going to return that value to the client 
 
 slide 13: (gives us a rundown of which regristers to use for what)
            jr only does a jump leaves no bread crumb
            jal leaves bred cumbs so u can always trace where you came back from
            $a0-$a3 (variables) $v0-$v1 (return values) $t (my responsiblity to save them) $s (respoonbiltiy of them to save them)
slide 14:  $gp used by complire (for this class its okay but normally dont touch)
            lets you know which regristers to save
slide 15:  a registers are to pass things in and always demarshallize them 
slide 16:  only save what you use (whiteboard example with professors)
slide 17:  main memory things of diff sizes (bytes halfs whole...)



           stacks are one uniform size
slide 18:  refer to picture for why mips grows down and stack grows up. if stack and heap ever meet its a trap.
slide 19:  reduces time it takes to run code by half
slide 20:  formal vs actual arguments : formal = int x (name we given it) vs  arguments = a (value)
slide 38: cisc = complex instrcution set computer : reduce the amount of times they had to go to memory so dont do anything in memory if you can avoid it. 
            recap about what we learned
            where are arguments placed ? answer the stack.

            lab time-
video in camera roll about nextint in mips in two parts due to storage usage.
