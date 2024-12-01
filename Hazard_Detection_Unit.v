`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/28/2024 10:31:34 PM
// Design Name: 
// Module Name: Hazard_Detection_Unit
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


module Hazard_Detection_Unit(
    input [4:0] IDEX_rs1, IDEX_rs2, IDEX_rd,
    input IDEX_MemRead,
    output reg stall // IFID_Write, PC_Write, IDEX_MuxOut,
    );

always @(*) begin
    if (IDEX_MemRead && (IDEX_rd == IDEX_rs1 || IDEX_rd == IDEX_rs2)) begin
        stall = 1; // IDEX_MuxOut = 1; IFID_Write = 0; PC_Write = 0; 
    end
    else begin
        stall = 0; // IDEX_MuxOut = 0; IFID_Write = 1; PC_Write = 1; 
    end
end
endmodule
