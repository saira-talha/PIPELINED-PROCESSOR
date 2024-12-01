module ALU_Control(
input [3:0] ALUOp,Funct,
output reg [3:0] Operation);
always@ (ALUOp or Funct)begin
	case(ALUOp)
		4'b00: // I/S-Type(ld,sd)
		begin
			case(Funct[2:0])
				4'b001: Operation = 4'b1000; // SLLI
				default: Operation = 4'b0010; // I - Type (ld, sd)
			endcase
		end
		4'b01: //SB-Type(Beq)
		begin
			Operation = 4'b0110;
		end
		4'b10: //R-Type
		begin
		case(Funct)
			4'b0000:
			begin
				Operation = 4'b0010;
			end
			4'b1000:
			begin
				Operation = 4'b0110;
			end
			4'b0111:
			begin
				Operation = 4'b0000;
			end	
			4'b0110:
			begin
				Operation = 4'b0001;
			end
		endcase	
		end
	endcase	
end
endmodule
