module LabM4;
reg clk, read, write;
reg [31:0] address, memIn;
wire [31:0] memOut;
mem data(memOut, address, memIn, clk, read, write);

initial begin
	#1 memIn = 32'h12345678; address = 16; write =1; clk =1;
	#1 clk = 0;
	#1 memIn = 32'h89abcdef; address = 24; write =1; clk =1;
	
	#1 write = 0; read = 1; address = 16;
	repeat (3) begin
		if(address%4==0) begin
			#1 $display("Address %d: Contains: %h", address, memOut);
			address = address + 4;
		end
		
		else begin
			#1 $display("Address %d  is an unaligned address",address);
			address = address + 4;
		end
	end 
end
endmodule