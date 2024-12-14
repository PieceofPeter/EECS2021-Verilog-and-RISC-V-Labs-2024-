module labM;
reg [31:0] PCin;
reg RegDst, RegWrite, clk, ALUSrc, MemRead, MemWrite, Mem2Reg;
reg [2:0] op;

wire [31:0] branch, wd, rd1, rd2, imm, ins, PCp4, z, memOut, wb;
wire [31:0] jTarget;
wire zero;

yIF myIF(ins, PCp4, PCin, clk);
yID myID(rd1, rd2, imm, jTarget, branch, ins, wd, RegWrite, clk);
yEX myEX(z, zero, rd1, rd2, imm, op, ALUSrc);
yDM myDM(memOut, z, rd2, clk, MemRead, MemWrite);
yWB myWB(wb, z, memOut, Mem2Reg);
assign wd = wb;

initial begin
    PCin = 16'h28;
    clk = 0;
    RegDst = 0; RegWrite = 0;
    ALUSrc = 0; MemRead = 0;
    MemWrite = 0; Mem2Reg = 0;
    op = 3'b010;


    repeat(43) begin
        #1 clk = 1;

        #1;
        if (ins[31:26] == 6'h00) begin
            // R-type
            RegDst = 1; RegWrite = 1; ALUSrc = 0;
            MemRead = 0; MemWrite = 0; Mem2Reg = 0;
            case (ins[5:0])
                6'h24: op = 3'b000; // AND
                6'h25: op = 3'b001; // OR
                6'h20: op = 3'b010; // ADD
                6'h22: op = 3'b110; // SUB
                6'h2A: op = 3'b111; // SLT
                default: op = 3'b010; // Default ADD
            endcase
        end 
		
		else if (ins[31:26] == 6'h02) begin
            // J-type
            RegDst = 0; RegWrite = 0; ALUSrc = 1;
            MemRead = 0; MemWrite = 0; Mem2Reg = 0;
        end 
		
		else begin
            // I-type
            case (ins[31:26])
                6'h08: begin // ADDI
                    RegDst = 0; RegWrite = 1; ALUSrc = 1;
                    MemRead = 0; MemWrite = 0; Mem2Reg = 0;
                end
                6'h23: begin // LW
                    RegDst = 0; RegWrite = 1; ALUSrc = 1;
                    MemRead = 1; MemWrite = 0; Mem2Reg = 1;
                end
                6'h2B: begin // SW
                    RegDst = 0; RegWrite = 0; ALUSrc = 1;
                    MemRead = 0; MemWrite = 1; Mem2Reg = 0;
                end
                6'h04: begin // BEQ
                    RegDst = 0; RegWrite = 0; ALUSrc = 0;
                    MemRead = 0; MemWrite = 0; Mem2Reg = 0;
                end
                default: begin
                    RegDst = 0; RegWrite = 0; ALUSrc = 0;
                    MemRead = 0; MemWrite = 0; Mem2Reg = 0;
                end
            endcase
        end

        // Execute instruction
        #1 clk = 0;
		
		// View results
        #1;
        $display("0x%h: rd1=%d rd2=%d z=%d zero=%b wb=%d", ins, rd1, rd2, z, zero, wb);

        // Prepare for the next instruction
        #2;
        if (ins[31:26] == 6'h04 && zero == 1) begin
            // BEQ
            PCin = PCin + (imm << 2);
        end 
		
		else if (ins[31:26] == 6'h02) begin
            // JUMP
            PCin = {PCp4[31:28], jTarget, 2'b00};
        end 
		
		else begin
            // Default to next sequential instruction
            PCin = PCp4;
        end

        
    end
end
endmodule
