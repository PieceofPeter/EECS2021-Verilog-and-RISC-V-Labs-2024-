module labL;
reg [1:0] c;
reg [31:0]  a0, a1, a2, a3, flag, expect;
wire [31:0] z;

yMux4to1 #(.SIZE(32)) my_mux(z, a0, a1, a2, a3, c); 
 initial 
  repeat(5)
  begin 
	a0 = $random;
	a1 = $random;
	a2 = $random;
	a3 = $random;
	c = $random %2;
	if(c==0) 
	#1 expect = a0;
	else if(c==1)
	#1 expect = a1;
	else if(c==2)
	#1 expect = a2;
	else if(c==3)
	#1 expect = a3;
		if(expect === z)
		#1 $display("Pass! z=%b", z);
		else
		#1 $display("Fail. z=%b", z);
  end 
endmodule