module labL;
reg c;
reg [1:0]  a, b, flag;
wire [1:0] z;

yMux2 Name(z, a, b, c);
 initial 
  begin 
	flag = $value$plusargs("a=%b", a); 
	flag = $value$plusargs("b=%b", b);
	flag = $value$plusargs("c=%b", c);
	#1 $display("z=%b", z);
  end 
 
endmodule