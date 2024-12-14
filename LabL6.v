module labL;
reg [31:0] a, b, expect;
reg ok, cin;
wire [31:0] z;
wire cout;

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