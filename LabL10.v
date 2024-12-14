module labL;
  reg signed [31:0] a, b;
  reg [31:0] expect;
  reg [2:0] op;
  wire ex;
  wire [31:0] z;
  reg ok, flag;

  yAlu mine(z, ex, a, b, op);

  initial
    repeat(10)
	begin
      a = $random;
      b = $random;
      flag = $value$plusargs("op=%b", op);
      
	  // The oracle: compute "expect" based on "op"
	  #1;
	  if(op===0)//000
	  expect = a&b;
	  else if(op===1)//001
	  expect = a|b;
	  else if(op===2)//010
	  expect[1:0] = a+b;
	  else if(op===6)//110
	  expect[1:0] = a-b;
	  else if (op == 3'b111) //111
	  expect = (a < b) ? 1 : 0; 
      #1;
	  //Compare the circuit's output with "expect" and set "ok" accordingly
	  
	  if(z===expect)
	  ok = 1;
	  else
	  ok = 0;
	  
	  //Display ok and the various signals
	  #1 $display ("ok=%b a=%b b=%b z=%b expect=%b op=%b", ok, a, b, z, expect, op);
       $finish;
    end
	
endmodule
