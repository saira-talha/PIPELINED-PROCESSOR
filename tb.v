`timescale 1ns / 1ps
//module tb();
//reg clk, reset;

//RISC_V_Processor RP1(
//	.clk(clk),
//	.reset(reset)
//);
	
//initial
//begin
//	clk = 1'b0;
//	reset = 1'b1;
	
//	#10 reset = 1'b0;
//end
	
//always
//	#5 clk = ~ clk;
	
//endmodule

module tb();
    reg clk, reset;

    // Wires to observe outputs from the RISC-V Processor
      wire [4:0] rd, rs1, rs2, IDEX_rd, IDEX_rs1, IDEX_rs2, rd_2, rd_3;
          wire IDEX_MemRead, MemRead_2, Branch_2, IDEX_Branch,IDEX_MemWrite;
       wire [6:0] opcode;
    wire stall;
      wire Branch, MemRead, MemWrite, MemtoReg, RegWrite, ALUSrc;
      wire [1:0] Forward_A,Forward_B;
    wire [31:0] Instruction, IFID_Instruction;
    wire [63:0] IDEX_ReadData1,IDEX_ReadData2, imm_data1;
     wire [63:0] PC_In, PC_Out, out_1, out2, imm_data, WriteData, ReadData1, ReadData2, Read_Data,IFID_PC_Out;
     wire IDEX_RegWrite,  MemWrite_2, MemtoReg_2, RegWrite_2, branch_op1,MemtoReg_3, RegWrite_3,IDEX_MemtoReg,IDEX_ALUSrc;
//     wire [63:0] D1, D2, D3, D4, D5, D6, D7, D8, D9, D10;
    wire [3:0] ALUOp;
      RISC_V_Processor uut (
        .clk(clk),
        .reset(reset), 
        .rd(rd),
        .rs1(rs1),
        .rs2(rs2),
        .IDEX_rs1(IDEX_rs1), 
        .IDEX_rs2(IDEX_rs2),
        .IDEX_rd(IDEX_rd),
        .rd_2(rd_2),
        .rd_3(rd_3),
        .IDEX_MemRead(IDEX_MemRead),
        .MemRead_2(MemRead_2),
        .Branch_2(Branch_2),
        .IDEX_Branch(IDEX_Branch),
        .opcode(opcode),
        .stall(stall),
        .Branch(Branch),
        .MemRead(MemRead),
        .MemWrite(MemWrite),
        .MemtoReg(MemtoReg),
        .RegWrite(RegWrite),
        .ALUSrc(ALUSrc),
        .ALUOp(ALUOp),
        .Instruction(Instruction),
        .IFID_Instruction(IFID_Instruction),
        .imm_data1(imm_data1),
        .IFID_PC_Out(IFID_PC_Out),       
        .PC_In(PC_In),
        .PC_Out(PC_Out),
        
        .out_1(out_1),
        .out2(out2),
        .imm_data(imm_data),
        .WriteData(WriteData),
        .ReadData1(ReadData1),
        .ReadData2(ReadData2),        
        .IDEX_ReadData1(IDEX_ReadData1),
        .IDEX_ReadData2(IDEX_ReadData2),
     
        .Read_Data(Read_Data),
        .IDEX_MemWrite(IDEX_MemWrite),        
        .IDEX_RegWrite(IDEX_RegWrite),
        .IDEX_MemtoReg(IDEX_MemtoReg),
        .IDEX_ALUSrc(IDEX_ALUSrc),
        .MemWrite_2(MemWrite_2),
        .MemtoReg_2(MemtoReg_2),
        .RegWrite_2(RegWrite_2),
        .branch_op1(branch_op1),
        .MemtoReg_3(MemtoReg_3),
        .RegWrite_3(RegWrite_3),
         .Forward_A(Forward_A),
        .Forward_B(Forward_B)
    );

initial begin
clk = 0; reset = 1;
#10 reset = 0;
#10 reset = 0;

end
always
    #5 clk = ~ clk;

     initial begin
        // Display initial values after reset
        $display("Initial Values:");
        $display("IDEX_rs1: %b, IDEX_rs2: %b, IDEX_rd: %b", IDEX_rs1, IDEX_rs2, IDEX_rd);
        $display("IFID_Instruction: %h, IFID_PC_Out: %h", IFID_Instruction, IFID_PC_Out);
        $display("IDEX_ReadData1: %b, IDEX_ReadData2: %b,", IDEX_ReadData1, IDEX_ReadData2);

        // Display values of pipeline registers at each clock cycle
        $monitor("At time %0t:", $time);
        $monitor("IDEX_rs1: %b, IDEX_rs2: %b, IDEX_rd: %b", IDEX_rs1, IDEX_rs2, IDEX_rd);
        $monitor("IFID_Instruction: %h, IFID_PC_Out: %h", IFID_Instruction, IFID_PC_Out);
        $monitor("IDEX_RegWrite: %b, IDEX_MemRead: %b, IDEX_MemWrite: %b", IDEX_RegWrite, IDEX_MemRead, IDEX_MemWrite);
        $monitor("EM_RegWrite: %b, EM_MemWrite: %b, EM_MemtoReg: %b", RegWrite_2, MemWrite_2, MemtoReg_2);
        $monitor("MW_RegWrite: %b, MW_MemtoReg: %b", RegWrite_3, MemtoReg_3);
        
        // Simulate for some time
        #100;
        $finish;  // End the simulation after 100 time units
    end
endmodule




//`timescale 1ns/1ps

//module RISC_V_Processor_tb;
//    // Inputs
//    reg clk;
//    reg reset;

//    // Outputs
//    wire [63:0] Result, ReadData1, ReadData2, PC_Out, Read_Data, imm_data, Write_Data;
//    wire [31:0] Instruction;
//    wire Branch, MemRead, MemtoReg, MemWrite, ALUSrc, RegWrite, Zero, Positive, branch_out;
//    wire [3:0] Operation;

//    // Instantiate the RISC_V_Processor
//        RISC_V_Processor uut (
//        .clk(clk),
//        .reset(reset),
//        .Result(Result),
//        .ReadData1(ReadData1),
//        .ReadData2(ReadData2),
//        .PC_Out(PC_Out),
//        .Write_Data(Write_Data),
//        .Instruction(Instruction),
//        .Read_Data(Read_Data),
//        .imm_data(imm_data),
//        .Branch(Branch),
//        .MemRead(MemRead),
//        .MemtoReg(MemtoReg),
//        .MemWrite(MemWrite),
//        .ALUSrc(ALUSrc),
//        .RegWrite(RegWrite),
//        .Zero(Zero),
//        .Positive(Posiive),
//        .branch_out(branch_out),
//        .Operation(Operation)
  
//    );

//    // Clock generation
//    always #5 clk = ~clk;

//    initial begin
//        // Initialize Inputs
//        clk = 0;
//        reset = 1;

//        // Apply Reset
//        #10;
//        reset = 0;

//        // Test Case 1: Observe IF/ID pipeline register behavior
//        #10;
//        $display("Time: %0t, IF/ID Outputs -> PC: %h, Instruction: %h", $time, uut.IFID_PC_Out, uut.IFID_Instruction);

//        // Test Case 2: Observe ID/EX pipeline register behavior
//        #10;
//        $display("Time: %0t, ID/EX Outputs -> PC: %h, imm_data: %h, ReadData1: %h, ReadData2: %h", 
//                 $time, uut.IDEX_PC_Out, uut.imm_data1, uut. uut.IDEX_ReadData2);

//        // Test Case 3: Observe EX/MEM pipeline register behavior
//        #10;
//        $display("Time: %0t, EX/MEM Outputs -> Result: %h, MemWrite: %b, ReadData2: %h", 
//                 $time, uut.Result, uut.MemWrite_2, uut.ReadData2_2);

//        // Test Case 4: Observe MEM/WB pipeline register behavior
//        #10;
//        $display("Time: %0t, MEM/WB Outputs -> Read_Data: %h, Result: %h, MemtoReg: %b", 
//                 $time, uut.Read_Data_1, uut.Result_2, uut.MemtoReg_3);

//        // End the simulation
//        #20;
//        $finish;
//    end

//    initial begin
//        $dumpfile("RISC_V_Processor_tb.vcd");
//        $dumpvars(0, RISC_V_Processor_tb);
//    end
//endmodule



//module tb();
//    reg clk, reset;

//    // Wires to observe outputs from the RISC-V Processor
//    wire [63:0] Result;        // ALU 64-bit output
//    wire [63:0] ReadData1;     // Register File Read Data 1
//    wire [63:0] ReadData2;     // Register File Read Data 2
//    wire [63:0] PC_Out;        // Current Program Counter
//    wire [31:0] Instruction;   // Current Instruction
//    wire [63:0] Read_Data;     // Data Memory Read Data
//    wire [63:0] imm_data;      // Immediate Data Extractor Output
//    wire Branch, MemRead, MemtoReg, MemWrite, ALUSrc, RegWrite; // Control Unit outputs
//    wire Zero, Positive, branch_out;  // ALU status signals and branch output
//    wire [3:0] Operation;     // ALU Control Signal

//    // Instantiate the RISC-V Processor
//    RISC_V_Processor RP1(
//        .clk(clk),
//        .reset(reset),
//        .Result(Result),
//        .ReadData1(ReadData1),
//        .ReadData2(ReadData2),
//        .PC_Out(PC_Out),
//        .Instruction(Instruction),
//        .Read_Data(Read_Data),
//        .imm_data(imm_data),
//        .Branch(Branch),
//        .MemRead(MemRead),
//        .MemtoReg(MemtoReg),
//        .MemWrite(MemWrite),
//        .ALUSrc(ALUSrc),
//        .RegWrite(RegWrite),
//        .Zero(Zero),
//        .Positive(Positive),
//        .branch_out(branch_out),
//        .Operation(Operation)
//    );

//    // Clock generation
//    initial begin
//        clk = 1'b0;
//        forever #5 clk = ~clk; // Toggle clock every 5 time units
//    end

//    // Reset generation
//    initial begin
//        reset = 1'b1;         // Assert reset initially
//        #10 reset = 1'b0;     // Deassert reset after 10 time units
//    end

//    // Monitor key outputs
//    initial begin
//        $monitor("Time: %0t | PC: %0h | Instruction: %0h | ALU Result: %0h | MemWrite: %0b | MemRead: %0b | ReadData1: %0h | ReadData2: %0h | Imm_Data: %0h | RegWrite: %0b",
//            $time, PC_Out, Instruction, Result, MemWrite, MemRead, ReadData1, ReadData2, imm_data, RegWrite
//        );
//    end

//    // End simulation after a certain duration
//    initial begin
//        #5000; // Run simulation for 5000 time units
//        $stop; // Stop simulation
//    end

//    // Factorial test case: Calculate factorial of 7
//    initial begin
//        // Initialize the registers for factorial calculation (x1 = 1, x2 = 7)
//        // x1 = 1 (for factorial result)
//        // x2 = 7 (starting point for factorial calculation)
//        #10;  // Delay to allow reset to complete

//        // Initialize the registers manually (x1 = 1, x2 = 7)
//        // You may want to use instructions like `addi`, `mul` for calculations
//        $display("Starting factorial calculation...");

//        // First, set x1 to 1 (store 1 in register x1)
//        // addi x1, zero, 1  // Set x1 = 1
//        // Set x2 to 7 (starting point for factorial calculation)
//        // addi x2, zero, 7  // Set x2 = 7

//        // Factorial loop:
//        // Multiply x1 by x2 and store the result back in x1
//        // Decrement x2 by 1 in each iteration until x2 = 1
//        // Continue looping until x2 = 1 (i.e., factorial of 7)

//        // Example of the loop in assembly (to be implemented in RISC-V assembly)
//        // addi x1, zero, 1        // Set x1 = 1
//        // addi x2, zero, 7        // Set x2 = 7
//        // Loop starts here:
//        // mul x1, x1, x2          // x1 = x1 * x2
//        // addi x2, x2, -1         // Decrement x2 by 1
//        // bnez x2, Loop           // Continue if x2 != 0 (branch if x2 != 0)
//        // When x2 = 1, the loop ends and x1 contains the factorial of 7 (5040)
        
//        // Assuming the processor has implemented the loop with proper instructions:
//        $display("Factorial of 7: %d", Result); // Print the result (Expected output: 5040)
//    end
//endmodule