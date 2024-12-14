module labL;
 reg [1:0] expect;
 reg a, b, cin, flag;
 integer i, j, k;
 wire z, cout;
 
 yAdder1 myAdder(z, cout, a, b, cin);
 
initial 
begin 
 for (i=0; i<2; i++)
 begin
	for (j=0; j<2; j++)
	begin
		for(k=0; k<2; k++)
		begin
		a=i; b=j; cin=k;
		#1 expect = a + b + cin;
		if(expect[0] !== z && expect[1] !== cout)
		#1 $display("FAIL... a=%b b=%b cin=%b z=%b cout=%b", a, b, cin, z, cout);
		end
	end
 end
end
endmodule