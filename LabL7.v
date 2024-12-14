module labL;
reg signed [31:0] a, b, expect;
reg signed ok, cin;
wire signed [31:0] z;
wire signed cout;

yAdder myAdder(z, cout, a, b, cin);

initial 
  repeat(5)
  begin 
	a = $random;
	b = $random;
	cin = 0;
	
	#1 expect = a + b + cin; 
	ok = 0;
	if (expect === z) 
	ok = 1; 
	#1 $display("Pass! a=%b b=%b cin=%b z=%b cout=%b", a, b, cin, z, cout);
  end

endmodule