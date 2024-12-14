// NAME: PIETRO ANGIOLELLA SN: 220378899

sq: DD 121, 33, -5, 242, -45, -12, 0 // intializes to sequence 
add x6, x0, x0 				
ld x7, sq(x0) 				// loads x7 with the first term of the sequence
add x8, x0, x0 				

loop: 				// loop function that loops through every term in the sequence
        ld x5, sq(x6) 				// loads x5 with  current term (uses x6 it has 0 bytes, then it incriments by 8)
        beq x5, x0, swap 				// if 0, its time to swap
        blt x5, x7, update 				// if the current term is less than the smallest found, branch to update
        addi x6, x6, 8 				// move to the next element in the sequence (8 bytes per)
        beq x0, x0, loop				// back to the start of the loop


update: 				// update method that updates the smallest found value
        add x7, x5, x0 				// update x7 with the smallest value
        add x8, x6, x0 				// update x8 with the current memory value (8 bytes per)
        addi x6, x6, 8 				// move to the next element
        beq x0, x0, loop 				// return to loop

swap:
        ld x5, sq(x0) 				// load the first element of the sequence (121)
        sd x7, sq(x0) 				// store (x7 (smallest)) in the first position
        sd x5, sq(x8) 				// stores (x5 (first)) in the position of the (x7 (smallest))
        ecall x10,x0,0 				// terminates at 0

