// PIETRO ANGIOLELLA 2203778899

d1: DF 1.0

ecall t0,x0,5
addi t2, x0,1
fld f1, d1(x0)



factorial:
      addi t1,t1,1
      mul t2, t2,t1
      beq x0,x0,div_part

div_part:
      fcvt.d.l f5, x7
      fdiv.d f6,f1,f5
      fadd.d f7,f7,f6
      bne t1,t0, factorial
      fadd.d f7,f7,f1
      beq x0,x0,end

end:ebreak x0,x0,0

