//module RISC_V_Processor(
//input clk, reset
//);

//wire [63:0] Result; //ALU 64bit
//wire [63:0]ReadData1; wire [63:0]ReadData2; //Register
//wire [63:0] PC_Out; // PC
//wire [6:0]opcode; wire [4:0]rd; wire [2:0]funct3; wire [4:0]rs1; wire [4:0]rs2; wire [6:0]funct7; //Parser
//wire [63:0]data_out1; //mux1
//wire [63:0]data_out2; //mux2
//wire [63:0]data_out3; //mux3
//wire [31:0] Instruction; //Instruction memory
//wire [63:0] Read_Data; //Data memory
//wire [63:0]imm_data; //data extractor
//wire Branch, MemRead, MemtoReg, MemWrite, ALUSrc, RegWrite, Zero, Positive, branch_out; //CU
//wire [1:0] ALUOp; wire [3:0] Operation; //ALU control
//wire [63:0]out1; //adder1
//wire [63:0]out2; //adder2


//Program_Counter PC(	
//	.PC_In(data_out1),
//	.clk(clk),
//	.reset(reset),
//	.PC_Out(PC_Out)
//);

//ALU_64_bit ALU1(
//	.a(ReadData1),
//	.b(data_out2),
//	.ALUOp(Operation),
//	.Result(Result),
//	.Zero(Zero),
//	.Positive(Positive)
//);

//registerFile RF(
//    .clk(clk), 
//	.reset(reset), 
//	.RegWrite(RegWrite),
//    .WriteData(data_out3), 
//	.RS1(rs1), 
//	.RS2(rs2), 
//	.RD(rd),
//    .ReadData1(ReadData1), 
//	.ReadData2(ReadData2)
//);

//parser P1(
//    .instruction(Instruction),
//    .opcode(opcode), 
//	.rd(rd), 
//	.funct3(funct3), 
//	.rs1(rs1), 
//	.rs2(rs2), 
//	.funct7(funct7)
//);
//branch_control_unit BCU(
//	.Branch(Branch),  
//	.Positive(Positive), 
//	.funct3(funct3),
//	.branch_out(branch_out),
//	.Zero(Zero)
//);

//mux M1(
//    .a(out1), 
//	.b(out2), 
//	.sel(branch_out), //check
//    .data_out(data_out1)
//);

//mux M2(
//    .a(ReadData2), 
//	.b(imm_data), 
//	.sel(ALUSrc),
//    .data_out(data_out2)
//);

//mux M3(
//    .b(Read_Data), 
//	.a(Result), 
//	.sel(MemtoReg),
//    .data_out(data_out3)
//);

//Instruction_Memory IM(
//	.Inst_Address(PC_Out),
//	.Instruction(Instruction)
//);

//Data_Memory DM(
//	.Mem_Addr(Result), 
//	.Write_Data(ReadData2),
//	.clk(clk), 
//	.Mem_Write(MemWrite), 
//	.Mem_Read(MemRead),
//	.Read_Data(Read_Data)
//);

//data_extractor DE(
//    .instruction(Instruction),
//    .imm_data(imm_data)
//);

//Control_Unit CU(
//	.Opcode(opcode),
//	.Branch(Branch), 
//	.MemRead(MemRead), 
//	.MemtoReg(MemtoReg), 
//	.MemWrite(MemWrite), 
//	.ALUSrc(ALUSrc), 
//	.RegWrite(RegWrite),
//	.ALUOp(ALUOp)
//);

//ALU_Control AC(
//	.ALUOp(ALUOp),
//	.Funct({Instruction[30], Instruction[14:12]}), //ask ms aiman
//	.Operation(Operation)
//);

//adder A1(
//    .a(PC_Out), 
//	.b(64'd4),
//    .out(out1) 
//);

//adder A2(
//    .a(PC_Out), 
//	.b(imm_data<<1), //check
//    .out(out2) 
//);

//endmodule


module RISC_V_Processor(
    input clk,
    input reset, 
    output reg [4:0] rd, rs1, rs2,IDEX_rs1, IDEX_rs2, IDEX_rd, rd_2, rd_3,
    output reg IDEX_MemRead, MemRead_2,Branch_2, IDEX_Branch,
    output reg [6:0] opcode,
    output reg stall,
    output reg Branch, MemRead, MemWrite, MemtoReg, RegWrite, ALUSrc,
    output reg [3:0] ALUOp,
    output reg  [31:0] Instruction, IFID_Instruction,
    output reg [63:0]  imm_data1,IFID_PC_Out, 
    output reg [63:0] PC_In, PC_Out, out_1, out2, imm_data, WriteData, ReadData1, ReadData2,IDEX_ReadData1,IDEX_ReadData2, Read_Data,
    output reg IDEX_MemWrite,  IDEX_RegWrite,IDEX_MemtoReg,IDEX_ALUSrc,  MemWrite_2, MemtoReg_2, RegWrite_2, branch_op1,MemtoReg_3, RegWrite_3,
    output reg [1:0] Forward_A, Forward_B
    );
// Declaration of all necessary wires // 
wire [63:0] a,b, out1, data_out1,data_out2, data_out3,Write_Data ;
wire [6:0]  funct7;
wire [31:0] Instruction, IFID_Instruction;
wire [3:0] Funct, Operation;
wire  [63:0] PC_In, PC_Out,  out_1, out2, imm_data, WriteData, ReadData1, ReadData2, Result, Read_Data,IDEX_ReadData1,IDEX_ReadData2,IDEX_PC_Out, imm_data1;
wire [2:0] funct3;
wire Zero, Positive,sel_Branch,  Branch, MemRead, MemWrite, MemtoReg, RegWrite, ALUSrc;
wire [3:0] IDEX_ALUOp,ALUOp;
wire stall;
wire [3:0] IDEX_Funct;
wire [63:0] Result_1, ReadData2_2, Result_2, Read_Data_1,IFID_PC_Out,EM_WriteData;
    wire MemtoReg_2, MemWrite_2, MemRead_2, flush;
    wire RegWrite_2, Branch_2, branch_op1;
     wire branch_op;
     wire MemtoReg_3;
     wire RegWrite_3,addermuxselect,EM_addermuxselect;
     wire IDEX_MemtoReg,IDEX_ALUSrc, IDEX_MemWrite,  IDEX_RegWrite,IDEX_MemRead, MemRead_2,Branch_2, IDEX_Branch;
     wire [6:0] opcode;
     wire  [4:0] rd, rs1, rs2,IDEX_rs1, IDEX_rs2, IDEX_rd, rd_2, rd_3;
     wire    [1:0] Forward_A, Forward_B;
     wire [63:0] va11, va12, va13, va14, va15, va16, va17, va18;


    mux M1(
        .a(out1),
        .b(out_1),
        .sel(sel_Branch),
        .data_out(PC_In)
    );
    // Instantiate Program Counter (PC)
    Program_Counter PC(
        .PC_In(PC_In),
        .clk(clk),
        .reset(reset),
          .stall(stall),
        .PC_Out(PC_Out)
    );
    
    adder A1(
        .a(PC_Out),
        .b(64'd4),
        .out(out1)
    );
    
   Instruction_Memory IM(
        .Inst_address(PC_Out),
        .Instruction(Instruction)
    );
    
    IF_ID ifid(.clk(clk), .reset(reset), .stall(stall),
    .Instruction(Instruction), 
    .PC_Out(PC_Out), .IFID_Instruction(IFID_Instruction), 
    .IFID_PC_Out(IFID_PC_Out));
    
    
//    Hazard_Detection_Unit HDU(.IDEX_rs1(IDEX_rs1), .IDEX_rs2(IDEX_rs2), .IDEX_rd(IDEX_rd), .IDEX_MemRead(IDEX_MemRead), .stall(stall));

    
//Instruction Decode:

   parser P1(
        .instruction(Instruction),
        .opcode(opcode),
        .rd(rd),
        .funct3(funct3),
        .rs1(rs1),
        .rs2(rs2),
        .funct7(funct7)
    );
    
    registerFile RF(
        .clk(clk),
        .reset(reset),
        .RegWrite(RegWrite_3),
        .WriteData(WriteData),
        .RS1(rs1),
        .RS2(rs2),
        .RD(rd_3),
        .ReadData1(ReadData1),
        .ReadData2(ReadData2)
    );
    
 
     Control_Unit CU(
        .Opcode(opcode),
         .stall(stall),
        .Branch(Branch),
        .MemRead(MemRead),
        .MemtoReg(MemtoReg),
        .MemWrite(MemWrite),
        .ALUSrc(ALUSrc),
        .RegWrite(RegWrite),
        .ALUOp(ALUOp)
    );
    
    data_extractor DE(
        .instruction(Instruction),
        .imm_data(imm_data)
    );
    
    assign Funct = {IFID_Instruction[30], IFID_Instruction[14:12]};
ID_EX idex(.clk(clk), .reset(reset), .Branch(Branch), .MemRead(MemRead), .MemWrite(MemWrite), .MemtoReg(MemtoReg), .RegWrite(RegWrite), .ALUSrc(ALUSrc), .ALUOp(ALUOp),
        .Funct(Funct), .rs1(rs1), .rs2(rs2), .rd(rd), .IFID_PC_Out(IFID_PC_Out), .ReadData1(ReadData1), .ReadData2(ReadData2), .imm_data(imm_data),
        .IDEX_Branch(IDEX_Branch), .IDEX_MemRead(IDEX_MemRead), .IDEX_MemWrite(IDEX_MemWrite), .IDEX_MemtoReg(IDEX_MemtoReg), .IDEX_RegWrite(IDEX_RegWrite), .IDEX_ALUSrc(IDEX_ALUSrc),
        .IDEX_ALUOp(IDEX_ALUOp), .IDEX_Funct(IDEX_Funct), .IDEX_rs1(IDEX_rs1), .IDEX_rs2(IDEX_rs2), .IDEX_rd(IDEX_rd),
        .IDEX_PC_Out(IDEX_PC_Out), .IDEX_ReadData1(IDEX_ReadData1), .IDEX_ReadData2(IDEX_ReadData2), .imm_data1(imm_data1));
    
    
       Hazard_Detection_Unit HDU(.IDEX_rs1(IDEX_rs1), .IDEX_rs2(IDEX_rs2), .IDEX_rd(IDEX_rd), .IDEX_MemRead(IDEX_MemRead), .stall(stall));
    
    adder A2(
        .a(IDEX_PC_Out),
        .b(imm_data1 << 1),
        .out(out2)
    );
    
    
    mux M2(
        .a(IDEX_ReadData2),
        .b(imm_data1),
        .sel(IDEX_ALUSrc),
        .data_out(data_out2)
    );
    
    ALU_Control AC(
        .ALUOp(IDEX_ALUOp),
        .Funct(IDEX_Funct),
        .Operation(Operation)
    );
    
   branch_control_unit BCU(
        .funct3(funct3),
        .ReadData1(ReadData1),
        .b(ReadData2),
        .addermuxselect(addermuxselect)
    );

    // ALU
    ALU_64_bit ALU1(
        .A(IDEX_ReadData1),
        .Out(WriteData),
        .Result_1(Result_1),
        .B(ReadData2),
        .RegWrite_3(RegWrite_3),
        .rd_3(rd_3),
        .rd_2(rd_2),
        .IDEX_rs1(IDEX_rs1),
        .IDEX_rs2(IDEX_rs2),
        .RegWrite_2(RegWrite_2),
        .ALUSrc(ALUSrc),
        .imm_data1(imm_data1),
        .ALUOp(ALUOp),
        .Forward_A(Forward_A),
        .Forward_B(Forward_B),
        .Result(Result),
        .Zero(Zero)
    );
    
//      Forwarding_Unit f1(
//            .IDEX_rs1(IDEX_rs1),
//            .IDEX_rs2(IDEX_rs2),
//            .rd_2(rd_2),
//            .RegWrite_2(RegWrite_2),
//            .rd_3(rd_3),
//            .RegWrite_3(RegWrite_3),
//            .Forward_A(Forward_A),
//            .Forward_B(Forward_B)
//        );
    
    EX_MEM EM(.clk(clk), .reset(reset),.Branch(IDEX_Branch), .MemRead(IDEX_MemRead), .MemWrite(IDEX_MemWrite), .MemtoReg(IDEX_MemtoReg), .RegWrite(IDEX_RegWrite),
        .branch_op(Zero),.addermuxselect(addermuxselect), .IDEX_rd(IDEX_rd), .out(out2), .Result(Result),  .IDEX_ReadData2(IDEX_ReadData2), 
        .Branch_2(Branch_2), .MemRead_2(MemRead_2), .MemWrite_2(MemWrite_2), .MemtoReg_2(MemtoReg_2), .RegWrite_2(RegWrite_2), .branch_op1(branch_op1), .EM_addermuxselect(EM_addermuxselect), .rd_2(rd_2), .out_1(out_1), .Result_1(Result_1),.EM_WriteData(IDEX_ReadData2));

   assign sel_Branch = Branch_2 && EM_addermuxselect;
    
    Data_Memory DM(
         .Mem_Addr(Result_1),
         .Write_Data(EM_WriteData),
         .clk(clk), 
         .Mem_Write(MemWrite_2),
         .Mem_Read(MemRead_2),
         .Read_Data(Read_Data) ,
         .va11(va11),
         .va12(va12),
         .va13(va13),
         .va14(va14),
         .va15(va15),
         .va16(va16),
         .va17(va17),
         .va18(va18)
 );
   
    
    MEM_WB MW(.clk(clk), .reset(reset), .MemtoReg_2(MemtoReg_2), .RegWrite_2(RegWrite_2), .rd_2(rd_2), .Result_1(Result_1), .Read_Data(Read_Data), 
        .MemtoReg_3(MemtoReg_3), .RegWrite_3(RegWrite_3), .rd_3(rd_3), .Result_2(Result_2), .Read_Data_1(Read_Data_1));

    mux M3(
        .b(Read_Data_1),
        .a(Result_2),
        .sel(MemtoReg_3),
        .data_out(WriteData)
    );

    // Instruction Memory


    // Data Memory


    // Data Extractor

    // Control Unit

    // ALU Control


    // Adders

 

    // Sequential block for capturing signal values during execution
//    always @(posedge clk or posedge reset) begin
//        if (reset) begin
//            PC_Out <= 64'd0;
//            Instruction <= 32'd0;
//            Result <= 64'd0;
//            ReadData1 <= 64'd0;
//            ReadData2 <= 64'd0;
//            Read_Data <= 64'd0;
//            imm_data <= 64'd0;
//            Branch <= 1'b0;
//            MemRead <= 1'b0;
//            MemWrite <= 1'b0;
//            MemtoReg <= 1'b0;
//            ALUSrc <= 1'b0;
//            RegWrite <= 1'b0;
//            Zero <= 1'b0;
//            Positive <= 1'b0;
//            branch_out <= 1'b0;
//            Operation <= 4'd0;
//        end else begin
//            // Capture necessary signals for debugging Bubble Sort
//            PC_Out <= PC_Out; // Updated by PC module
//            Instruction <= Instruction; // From Instruction Memory
//            Result <= Result; // ALU Result
//            ReadData1 <= ReadData1; // Register File Read Data 1
//            ReadData2 <= ReadData2; // Register File Read Data 2
//            Read_Data <= Read_Data; // Data Memory output
//            imm_data <= imm_data; // Immediate data
//            Branch <= Branch; // From Control Unit
//            MemRead <= MemRead; // From Control Unit
//            MemWrite <= MemWrite; // From Control Unit
//            MemtoReg <= MemtoReg; // From Control Unit
//            ALUSrc <= ALUSrc; // From Control Unit
//            RegWrite <= RegWrite; // From Control Unit
//            Zero <= Zero; // ALU status flag
//            Positive <= Positive; // ALU status flag
//            branch_out <= branch_out; // From Branch Control Unit
//            Operation <= Operation; // ALU Operation
//        end
//    end
endmodule