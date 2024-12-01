`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/18/2024 12:52:03 AM
// Design Name: 
// Module Name: IF_ID
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


//module IF_ID(
//    input clk,
//    input reset,
//    input stall,
//    input [31:0] Instruction,
//    input [63:0] PC_Out,
//    output reg [31:0] IFID_Instruction,
//    output reg [63:0] IFID_PC_Out
//    );
//always @(posedge clk or posedge reset) begin
//    if (reset == 1'b1) begin
//        IFID_Instruction = 0; IFID_PC_Out = 0;
//    end
//    else if (stall == 1'b1) begin
//        IFID_PC_Out = IFID_PC_Out; IFID_Instruction = IFID_Instruction;
//    end
//    else begin
//        IFID_Instruction = Instruction; IFID_PC_Out = PC_Out;
//    end
//end
//endmodule

//module IF_ID(
//    input clk,
//    input reset,
//    input stall,
//    input flush,                    // Added flush signal
//    input [31:0] Instruction,
//    input [63:0] PC_Out,
//    output reg [31:0] IFID_Instruction,
//    output reg [63:0] IFID_PC_Out
//    );

//    always @(posedge clk or posedge reset) begin
//        if (reset == 1'b1) begin
//            IFID_Instruction <= 32'b0; 
//            IFID_PC_Out <= 64'b0;
//        end
//        else if (flush == 1'b1) begin
//            IFID_Instruction <= 32'b0; 
//            IFID_PC_Out <= 64'b0;     // Clears values on flush
//        end
//        else if (stall == 1'b1) begin
//            IFID_Instruction <= IFID_Instruction; 
//            IFID_PC_Out <= IFID_PC_Out; // Hold current values
//        end
//        else begin
//            IFID_Instruction <= Instruction; 
//            IFID_PC_Out <= PC_Out;   // Update values
//        end
//    end
//endmodule


module IF_ID(
    input clk,
    input reset,
    input stall,
    input [31:0] Instruction,
    input [63:0] PC_Out,
    output reg [31:0] IFID_Instruction,
    output reg [63:0] IFID_PC_Out
    );
always @(posedge clk or posedge reset) begin
    if (reset == 1'b1) begin
        IFID_Instruction = 0; IFID_PC_Out = 0;
    end
    else if (stall == 1'b1) begin
        IFID_PC_Out = IFID_PC_Out; IFID_Instruction = IFID_Instruction;
    end
    else begin
        IFID_Instruction = Instruction; IFID_PC_Out = PC_Out;
    end
end
endmodule
