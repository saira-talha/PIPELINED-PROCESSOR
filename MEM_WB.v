`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/18/2024 02:06:49 AM
// Design Name: 
// Module Name: MEM_WB
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

module MEM_WB(
     input clk,reset,
     input MemtoReg_2,RegWrite_2, 
      input [4:0] rd_2, 
     input [63:0] Result_1, Read_Data, // input data from mem
    output reg  MemtoReg_3,RegWrite_3,
    output reg [4:0] rd_3,
    output reg [63:0]  Result_2,Read_Data_1
);
always @(posedge clk or posedge reset)
begin
    if (reset==1'b1) // Check if reset
    begin
        // Reset all registers and outputs to zero
        Read_Data_1 <= 64'd0;
        Result_2 <= 64'd0;
        RegWrite_3 <= 1'b0;
        MemtoReg_3 <= 1'b0;
        rd_3 <= 5'd0;
    end
    else
    begin
        // Assign output regs to input values
        Read_Data_1 <= Read_Data;
        Result_2 <= Result_1;
        RegWrite_3 <= RegWrite_2;
        MemtoReg_3 <= MemtoReg_2;
        rd_3 <= rd_2;
    end
end
endmodule
