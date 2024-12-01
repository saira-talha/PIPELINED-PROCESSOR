//module ALU_64_bit
//(
//	input [63:0] a,
//	input [63:0] b,
//	input [3:0] ALUOp,
//	output reg [63:0] Result,
//	output reg Zero,
//	output reg Positive
//);
		
//always @(*)
//begin
//	case (ALUOp)
//			4'b0000: 
//				Result = a & b;
//			4'b0001: 
//				Result = a | b;
//			4'b0010: 
//				Result = a + b;
//			4'b0110: 
//				Result = a - b;
//			4'b1100: 
//				Result = ~(a | b);

//	endcase
//Zero = 1'b0;
//Positive = 1'b0;
	
//if (Result == 64'd0)
//	Zero = 1'b1;
//else if (Result[63] == 1'b1)
//	Positive = 1'b1;
	
////if (Result > 64'd0)
////	Positive = 1'b1; //if result positive
////else
////	Positive = 1'b0; //if result negative
//end
//endmodule 



module ALU_64_bit(
//    input clk,
//    input reset,
    input [63:0] A,
    input [63:0] Out,
    input [63:0] Result_1,
    input [63:0] B,
    input RegWrite_3,
    input [4:0] rd_3,
    input [4:0] rd_2,
    input [4:0] IDEX_rs1,
    input [4:0] IDEX_rs2,
    input RegWrite_2,
    input ALUSrc,
    input [63:0] imm_data1,
    input [3:0] ALUOp,
    output reg [1:0] Forward_A,
    output reg [1:0] Forward_B,
//    output reg [63:0] mux1out,
//    output reg [63:0] mux2out,
//    output reg [63:0] mux3out,
    output reg [63:0] Result,
    output reg Zero
    );
    
    reg Forward_A;
    reg Forward_B;
    reg mux1out;
    reg mux2out;
    reg mux3out;
    
always @(*) begin

    //EX Hazard
    assign Forward_A= 2'b00;
    assign Forward_B= 2'b00;
    if (RegWrite_2)
        begin
            if ((rd_2 != 0) & (rd_2 == IDEX_rs1))
                begin
                     assign Forward_A = 2'b10;
                end
            if ((rd_2 != 0) & (rd_2 == IDEX_rs2))
                begin
                    assign Forward_B = 2'b10;
                end
        end
        
    // MEM Hazard
    if (RegWrite_3)
        begin
            if ((rd_3 != 0) & (RegWrite_2 == 0 & rd_2 == 0) & (rd_2 != IDEX_rs1) & (rd_3 == IDEX_rs1))
                begin
                    assign Forward_A = 2'b01;
                end
            if ((rd_3 != 0) & (RegWrite_2 == 0 & rd_2 == 0) & (rd_2 != IDEX_rs2) & (rd_3 == IDEX_rs2))
                begin
                    assign Forward_B = 2'b01;
                end
        end   
    if (RegWrite_2 == 0 & RegWrite_3 == 0)
        begin 
            assign Forward_A = 2'b00;
            assign Forward_B = 2'b00;
        end   
        
     //Forward_A  
    case(Forward_A)
        2'b00: mux1out = A;   
        2'b01: mux1out = Out;
        2'b10: mux1out = Result_1;
    endcase  
    
    //Forward_B
    case(Forward_B)
        2'b00: mux2out = B;   
        2'b01: mux2out = Out;
        2'b10: mux2out = Result_1;
    endcase  
    
    //Mux3 to check 2nd operand of ALU is immediate data or is coming from Mux2
    if (ALUSrc)
        mux3out = imm_data1;
    else
        mux3out = mux2out;
        
    //Result
    case (ALUOp)
        4'b0000: Result = mux1out & mux3out;
        4'b0001: Result = mux1out | mux3out;
        4'b0010: Result = mux1out + mux3out;
        4'b0110: Result = mux1out - mux3out;
        4'b1100: Result = ~(mux1out | mux3out);
    endcase

    if (Result == 64'd0) Zero = 1'b1;
    else Zero = 1'b0;
end
endmodule