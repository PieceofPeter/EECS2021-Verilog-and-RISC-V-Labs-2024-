module labN;
    wire [31:0] PCin, PC;
    reg clk, INT;
    reg [2:0] op;
    reg [31:0] entryPoint;

    wire [31:0] wd, rd1, rd2, imm, ins, PCp4, z, branch;
    wire [31:0] jTarget;
    wire [31:0] memOut, wb;
    wire zero;
    wire [6:0] opCode;
    wire isStype, isRtype, isItype, isLw, isjump, isbranch;
    wire RegWrite, ALUSrc, MemRead, MemWrite, Mem2Reg;

    yIF myIF(ins, PC, PCp4, PCin, clk);
    yID myID(rd1, rd2, imm, jTarget, branch, ins, wd, RegWrite, clk);
    yEX myEx(z, zero, rd1, rd2, imm, op, ALUSrc);
    yDM myDM(memOut, z, rd2, clk, MemRead, MemWrite);
    yWB myWB(wb, z, memOut, Mem2Reg);

    assign wd = wb; 
    yPC myPC(PCin, PC, PCp4, INT, entryPoint, branch, jTarget, zero, isbranch, isjump);

    assign opCode = ins[6:0];
    yC1 myC1(isStype, isRtype, isItype, isLw, isjump, isbranch, opCode);
    yC2 myC2(RegWrite, ALUSrc, MemRead, MemWrite, Mem2Reg, isStype, isRtype, isItype, isLw, isjump, isbranch);

    initial
    begin
        INT = 1;
        entryPoint = 16'h28; #1;
        repeat (43)
        begin
            clk = 1; #1;
            INT = 0;
            op = 3'b010;

            if (ins[6:0] == 7'h33) begin
                op = 3'b010;
                if(ins[14:12] == 3'b110)
                    op = 3'b001;
            end
            else if (ins[6:0] == 7'h6F) begin

            end
			
            else if (ins[6:0] == 7'h3) begin

            end
            else if (ins[6:0] == 7'h13) begin

            end
            else if (ins[6:0] == 7'h23) begin
			
            end
            else if (ins[6:0] == 7'h63) begin
                op = 3'b110;
            end
            
            clk = 0; #1;
            #4 $display("%8h: rd1=%d rd2=%d exeOut=%d zero=%b wb=%d", ins, rd1, rd2, imm, zero, wb);
        end
        $finish;
    end
endmodule