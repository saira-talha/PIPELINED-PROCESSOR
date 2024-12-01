module Control_Unit(
input [6:0] Opcode,
 input stall,
output reg Branch, MemRead, MemtoReg, MemWrite, ALUSrc, RegWrite,
output reg [3:0] ALUOp
);

always@(*)
begin
	case(Opcode)
		7'b0110011: //R-Type
		begin
			Branch = 1'b0;
			MemRead = 1'b0;
			MemtoReg = 1'b0;
			MemWrite = 1'b0;
			ALUSrc = 1'b0;
			RegWrite = 1'b1;
			ALUOp = 4'b10;	
		end
		
		7'b0000011: //I-Type(ld)
		begin
			Branch = 1'b0;
			MemRead = 1'b1;
			MemtoReg = 1'b1;
			MemWrite = 1'b0;
			ALUSrc = 1'b1;
			RegWrite = 1'b1;
			ALUOp = 4'b00;
		end
		
		7'b0010011: begin //I-Type Instruction (addi)
            Branch = 1'b0;
            MemRead = 1'b0; 
            MemtoReg = 1'b0; 
            MemWrite = 1'b0; 
            ALUSrc = 1'b1;
             RegWrite = 1'b1;
                   ALUOp = 4'b00;
        end

		
		7'b0100011: //S-Type(sd)
		begin
			Branch = 1'b0;
			MemRead = 1'b0;
			MemtoReg = 1'bx;
			MemWrite = 1'b1;
			ALUSrc = 1'b1;
			RegWrite = 1'b0;
			ALUOp = 4'b00;
		end
		
		7'b1100011: //SB-Type(Beq)
		begin
			Branch = 1'b1;
			MemRead = 1'b0;
			MemtoReg = 1'bx;
			MemWrite = 1'b0;
			ALUSrc = 1'b0;
			RegWrite = 1'b0;
			ALUOp = 4'b01;
		end
		 default: begin //Default Condition
            Branch = 1'b0; MemRead = 1'b0; MemtoReg = 1'b0; ALUOp = 4'b00;
            MemWrite = 1'b0; ALUSrc = 1'b0; RegWrite = 1'b0;
        end
	endcase
	if (stall == 1) begin
        Branch = 1'b0; MemRead = 1'b0; MemtoReg = 1'b0; ALUOp = 4'b00;
        MemWrite = 1'b0; ALUSrc = 1'b0; RegWrite = 1'b0;
    end
end
endmodule