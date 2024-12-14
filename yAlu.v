module yAlu(z, ex, a, b, op);
  input signed [31:0] a, b;
  input [2:0] op;
  output [31:0] z;
  output ex;
 wire [31:0] addsubz, andz, orz, slt, tmp;

wire[15:0] z16;
wire[7:0] z8;
wire[3:0] z4;
wire[1:0] z2;
wire z1, z0;

 assign slt[31:1] = 0; // not supported
 
 xor myxor(condition, a[31], b[31]);
 yArith myArith2(tmp, ex, a, b, op[0]);
 yMux #(1) myMux2(slt[0], tmp[31], a[31], condition);
 
 or or16[15:0] (z16, z[15:0], z[31:16]);
 or or8[7:0]  (z8, z16[7:0], z16[15:8]);
 or or4[3:0] (z4, z8[3:0], z8[7:4]);
 or or2[1:0] (z2, z4[1:0], z4[3:2]);
 or or1 (z1, z2[0], z2[1]); 
 not notz(z0, z1);
 assign ex = z0;
 
 // Instantiate components and connect them (4 lines of code)
 and my_and[31:0](andz, a, b);
 or my_or[31:0](orz, a, b);
 yArith myArith(addsubz, ex, a, b, op[2]);
 yMux4to1 #(32) myMux(z, andz, orz, addsubz, slt, op[1:0]); 

endmodule
