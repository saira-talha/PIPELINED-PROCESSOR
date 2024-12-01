`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/29/2024 02:15:32 AM
// Design Name: 
// Module Name: data_haz_tb
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
`timescale 1ns / 1ps

module data_haz_tb;

    // Inputs to the HDU
    reg [4:0] IDEX_rs1;
    reg [4:0] IDEX_rs2;
    reg [4:0] IDEX_rd;
    reg IDEX_MemRead;

    // Output from the HDU
    wire stall;

    // Instantiate the Hazard Detection Unit
    Hazard_Detection_Unit HDU (
        .IDEX_rs1(IDEX_rs1),
        .IDEX_rs2(IDEX_rs2),
        .IDEX_rd(IDEX_rd),
        .IDEX_MemRead(IDEX_MemRead),
        .stall(stall)
    );

    // Testbench process
    initial begin
        // Monitor values
        $monitor("Time = %0t | rs1 = %b | rs2 = %b | rd = %b | MemRead = %b | Stall = %b",
                 $time, IDEX_rs1, IDEX_rs2, IDEX_rd, IDEX_MemRead, stall);

//        // Initialize inputs

        // lw x2,0(x2)
        IDEX_rs1 = 5'b00010; IDEX_rs2 = 5'b00000; IDEX_rd = 5'b00010; IDEX_MemRead = 1;
        #10; // Hazard (rs1 == rd), stall = 1
        // add x4, x3,x2
        IDEX_rs1 = 5'b00011; IDEX_rs2 = 5'b00010; IDEX_rd = 5'b000100; IDEX_MemRead = 0;
        #10; // Hazard (rs2 == rd), stall = 1

        IDEX_rs1 = 5'b00001; IDEX_rs2 = 5'b00010; IDEX_rd = 5'b00100; IDEX_MemRead = 1;
        #10; // No hazard, stall = 0

        IDEX_rs1 = 5'b00001; IDEX_rs2 = 5'b00010; IDEX_rd = 5'b00000; IDEX_MemRead = 1;
        #10; // No hazard (rd == 0), stall = 0

        $finish; // End the simulation
    end

endmodule
