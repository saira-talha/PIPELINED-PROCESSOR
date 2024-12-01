`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/18/2024 01:18:23 AM
// Design Name: 
// Module Name: ID_EX
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module ID_EX(
    input clk, reset,    // Input signals from the previous pipeline stage
    input Branch,MemRead,MemWrite,MemtoReg, RegWrite,  ALUSrc,   
     input [3:0] ALUOp,
     input [3:0] Funct,
     input [4:0] rs1, rs2, rd,
    input [63:0] IFID_PC_Out, ReadData1, ReadData2, imm_data,    
     output reg IDEX_Branch,IDEX_MemRead, IDEX_MemWrite, IDEX_MemtoReg, IDEX_RegWrite, IDEX_ALUSrc,
      output reg [3:0] IDEX_ALUOp,
        output reg [3:0] IDEX_Funct,
         output reg [4:0] IDEX_rs1, IDEX_rs2, IDEX_rd,
    output reg [63:0] IDEX_PC_Out, IDEX_ReadData1, IDEX_ReadData2, imm_data1);
    always @ (posedge clk or posedge reset) // Register values on the rising edge of the clock
    begin
        if (reset==1'b1) // Reset or flush condition
        begin
            IDEX_PC_Out = 64'd0;
            imm_data1 = 64'd0;
            IDEX_Funct = 4'd0;
            IDEX_rd = 5'd0;
            IDEX_rs1 = 5'd0;
            IDEX_rs2 = 5'd0;
            IDEX_RegWrite = 1'b0;
            IDEX_Branch = 1'b0;
            IDEX_ALUSrc = 1'b0;
             IDEX_ReadData1 = 64'd0;
            IDEX_ReadData2 = 64'd0;
            IDEX_MemRead = 1'b0;
            IDEX_MemWrite = 1'b0;
            IDEX_MemtoReg = 1'b0;
            IDEX_ALUOp = 4'b00;
        end
        else
        begin
            IDEX_PC_Out = IFID_PC_Out;
            IDEX_ReadData1 = ReadData1;
            IDEX_ReadData2 = ReadData2;
            imm_data1 <= imm_data;
            IDEX_Funct <= Funct;
            IDEX_rd <= rd;
            IDEX_rs1 <= rs1;
            IDEX_rs2 <= rs2;
            IDEX_RegWrite <= RegWrite;
            IDEX_Branch <= Branch;
            IDEX_ALUSrc <= ALUSrc;
            IDEX_MemRead <= MemRead;
            IDEX_MemWrite <= MemWrite;
            IDEX_MemtoReg <= MemtoReg;
            IDEX_ALUOp <= ALUOp;
        end
    end
endmodule

