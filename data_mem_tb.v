`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/16/2024 06:47:58 PM
// Design Name: 
// Module Name: data_mem_tb
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


module data_mem_tb;

  // Testbench variables
  reg clk;
  reg Mem_Read;
  reg Mem_Write;
  reg [63:0] Mem_Addr;
  reg [63:0] Write_Data;
  wire [63:0] Read_Data;
  wire [63:0] va11, va12, va13, va14, va15, va16, va17, va18;
  reg[63:0] temp;

  // Instantiate the Data_Memory module
  Data_Memory uut (
    .Mem_Addr(Mem_Addr),
    .Write_Data(Write_Data),
    .clk(clk),
    .Mem_Read(Mem_Read),
    .Mem_Write(Mem_Write),
    .Read_Data(Read_Data),
     .va11(va11),
         .va12(va12),
         .va13(va13),
         .va14(va14),
         .va15(va15),
         .va16(va16),
         .va17(va17),
         .va18(va18)
  );

  // Clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10ns clock period
  end

  // Test initialization and bubble sort implementation
     integer i;
    integer j;
  initial begin
    // Reset all inputs
    Mem_Read = 0;
    Mem_Write = 0;
    Mem_Addr = 0;
    Write_Data = 0;

    // Wait for clock edge
    #10;

    // Display initial memory state
//    $display("Initial Data Memory State:");
//    $display("D1=%d, D2=%d, D3=%d, D4=%d, D5=%d, D6=%d, D7=%d, D8=%d, D9=%d, D10=%d", val1, val2, val3, val4, val5, val6, val7, val8);

    // Simulate bubble sort
 


    for (i = 0; i < 9; i = i + 1) begin
      for (j = 0; j < 9 - i; j = j + 1) begin
        // Read current element
        Mem_Read = 1;
        Mem_Addr = j * 8;
        #10;
        temp = Read_Data;

        // Read next element
        Mem_Addr = (j + 1) * 8;
        #10;

        // Compare and swap if necessary
        if (temp > Read_Data) begin
          // Write next element to current position
          Mem_Write = 1;
          Mem_Addr = j * 8;
          Write_Data = Read_Data;
          #10;
          Mem_Write = 0;

          // Write current element to next position
          Mem_Write = 1;
          Mem_Addr = (j + 1) * 8;
          Write_Data = temp;
          #10;
          Mem_Write = 0;
        end
      end
    end

    // Display final memory state
//    $display("Final Data Memory State After Bubble Sort:");
//    $display("D1=%d, D2=%d, D3=%d, D4=%d, D5=%d, D6=%d, D7=%d, D8=%d, D9=%d, D10=%d", D1, D2, D3, D4, D5, D6, D7, D8, D9, D10);

    // End simulation
    $stop;
  end

endmodule

