module labL;
reg signed [31:0] a, b, expect;
wire signed [31:0] z;
wire signed cout;
reg signed ctrl;

yArith myArith(z, cout, a, b, ctrl);

initial 
  repeat(5)
  begin 
	a = $random;
	b = $random;
	ctrl = $random %1;
	
	#1 $display("a=%b b=%b cin=%b z=%b cout=%b", a, b, ctrl, z, cout);
  end

endmodule