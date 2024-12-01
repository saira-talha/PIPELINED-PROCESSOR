`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/18/2024 01:39:11 AM
// Design Name: 
// Module Name: EX_MEM
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


module EX_MEM(
    // Input signals from the execute stage
    input clk ,reset,
    input Branch, MemRead, MemWrite, MemtoReg, RegWrite, 
    input branch_op, 
    input addermuxselect,
    input [4:0] IDEX_rd,
    input  [63:0] out, Result, IDEX_ReadData2,
    // Output signals to the memory stage
    output reg  Branch_2,MemRead_2, MemWrite_2, MemtoReg_2,RegWrite_2,
    output reg  branch_op1,
    output reg EM_addermuxselect,
     output reg [4:0] rd_2,
     output reg [63:0] out_1, Result_1,EM_WriteData);
    always @(posedge clk or  posedge reset )
    begin
        if (reset == 1'b1) // Check if reset or flush signal is asserted
            begin
            out_1 <= 64'd0;
            Result_1 <= 64'd0;
            EM_WriteData <= 64'd0;
            rd_2 <= 5'd0;
            MemtoReg_2 <= 1'b0;
            MemWrite_2 <= 1'b0;
            MemRead_2 <= 1'b0;
            RegWrite_2 <= 1'b0;
            branch_op1 <= 1'b0;
            Branch_2 <= 1'b0;
             EM_addermuxselect = 1'b0;
        end
        else
        begin
            // Assign output regs to input values
            out_1 <= out;
            Result_1 <= Result;
            EM_WriteData <= IDEX_ReadData2;
            rd_2 <= IDEX_rd;
            MemtoReg_2 <= MemtoReg;
            MemWrite_2 <= MemWrite;
            MemRead_2 <= MemRead;
            RegWrite_2 <= RegWrite;
            branch_op1 <= branch_op;
            Branch_2 <= Branch;
            EM_addermuxselect = addermuxselect;
        end
    end
endmodule




