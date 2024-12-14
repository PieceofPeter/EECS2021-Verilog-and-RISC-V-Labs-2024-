module LabM3;
wire [31:0] rd1, rd2;
reg [31:0] wd;
reg [4:0] rn1, rn2, wn;
reg clk, w, flag;
rf myRF(rd1, rd2, rn1, rn2, wn, wd, clk, w);
integer i;
initial begin
	flag = $value$plusargs("w=%b", w);
	repeat(10) begin
		#1 rn1 = $random;
		#1 rn2 = $random;
	end
	
	for (i = 0; i < 32; i = i + 1) begin
		clk = 0;
		wd = i * i;
		wn = i;
		clk = 1;
		$display("rd1=%b rd2=%b rn1=%b rn2=%b wn=%b wd=%b clk=%b w=%b", rd1, rd2, rn1, rn2, wn, wd, clk, w);
		#1;
	end
	
	$finish; 
end
endmodule