module labK;
reg a, b, c, flag;
wire notz,a1, a2, z;

not my_not(notz,c);
and my_and(a1,notz,a);
and my_and2(a2, b, c);
or my_or(z,a1,a2);

initial 
begin
     flag = $value$plusargs("a=%b", a);
     flag = $value$plusargs("b=%b", b);
     flag = $value$plusargs("c=%b", c);

     #1 $display("z=%b",z);
end  

endmodule