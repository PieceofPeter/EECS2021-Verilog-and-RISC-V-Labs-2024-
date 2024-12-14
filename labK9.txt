module labK;
reg a, b, cin, flag;
wire z,cout,notboth,andboth,andcin;

xor my_xor(notboth, a, b);
and my_and(andboth, a, b);
xor my_xor2(z,cin,notboth);
and my_and2(andcin,cin,notboth);
or my_or(cout,andcin,andboth);


initial 
begin
     flag = $value$plusargs("a=%b", a);
     flag = $value$plusargs("b=%b", b);
     flag = $value$plusargs("cin=%b", cin);

     #1 $display("z=%b",z);
	    $display("cout=%b",cout);
end  

endmodule