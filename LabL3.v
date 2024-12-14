module labL;
reg c;
reg [31:0]  a, b, flag, expect;
wire [31:0] z;

yMux #(.SIZE(32)) my_mux(z, a, b, c); 
 initial 
  repeat(10)
  begin 
	a = $random;
	b = $random;
	c = $random %2;
	if(c==0) 
	#1 expect = a;
	else if(c==1)
	#1 expect =b;
		if(expect === z)
		#1 $display("Pass! z=%b", z);
		else
		#1 $display("Fail. z=%b", z);
  end 
 
endmodule