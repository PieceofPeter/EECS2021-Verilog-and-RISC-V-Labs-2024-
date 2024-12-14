//PIETRO ANGIOLELLA 220378899

c2: DC "Prime"
c3: DC "Not Prime"
c: DC "Find all divisors."
c1: DC "Enter i:"

addi t6, x0, c
addi t5,x0,c1
ecall x0,t6,4
ecall x0,t5,4
ecall t0,x0,5
addi t4, t0, 1

loop:
    addi t1,t1,1
    rem t2, t0,t1
    beq t2, x0, sum
    beq t1,t4,end
    beq x0,x0,loop
    
sum:
   add t3,t3,t1
   beq x0,x0,loop

end:
   bne t3,t4,nprime
   beq x0,x0,prime

prime:
   addi t6,x0,c2
   ecall x0,t6,4
   ebreak x0,x0,0

nprime:
   addi t6,x0,c3
   ecall x0,t6,4
   ebreak x0,x0,0

