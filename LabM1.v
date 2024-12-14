module labM;
reg [31:0] d, expect;
reg clk, enable, flag;
wire [31:0] z;
register #(32) mine(z, d, clk, enable);

always begin
	#5 clk = ~clk;
	#1 expect = z;
	
	#1 $monitor("%5d: clk=%b,d=%d,z=%d,expect=%d", $time,clk,d,z, expect); 

	

end

initial begin
	flag = $value$plusargs("enable=%b", enable);
	clk = 0; #1
	
	repeat (20) begin
		#2 d = $random;
	end 
	

	$finish;

end

endmodule 