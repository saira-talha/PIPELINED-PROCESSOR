

module tb_ID_EX;
    // Inputs
    reg clk, reset;
    reg Branch, MemRead, MemWrite, MemtoReg, RegWrite, ALUSrc;
    reg [1:0] ALUOp;
    reg [3:0] Funct;
    reg [4:0] rs1, rs2, rd;
    reg [63:0] IFID_PC_Out, ReadData1, ReadData2, imm_data;

    // Outputs
    wire IDEX_Branch, IDEX_MemRead, IDEX_MemWrite, IDEX_MemtoReg, IDEX_RegWrite, IDEX_ALUSrc;
    wire [1:0] IDEX_ALUOp;
    wire [3:0] IDEX_Funct;
    wire [4:0] IDEX_rs1, IDEX_rs2, IDEX_rd;
    wire [63:0] IDEX_PC_Out, IDEX_ReadData1, IDEX_ReadData2, imm_data1;

    // Instantiate the ID_EX module
    ID_EX uut (
        .clk(clk),
        .reset(reset),
//        .flush(flush),
        .Branch(Branch),
        .MemRead(MemRead),
        .MemWrite(MemWrite),
        .MemtoReg(MemtoReg),
        .RegWrite(RegWrite),
        .ALUSrc(ALUSrc),
        .ALUOp(ALUOp),
        .Funct(Funct),
        .rs1(rs1),
        .rs2(rs2),
        .rd(rd),
        .IFID_PC_Out(IFID_PC_Out),
        .ReadData1(ReadData1),
        .ReadData2(ReadData2),
        .imm_data(imm_data),
        .IDEX_Branch(IDEX_Branch),
        .IDEX_MemRead(IDEX_MemRead),
        .IDEX_MemWrite(IDEX_MemWrite),
        .IDEX_MemtoReg(IDEX_MemtoReg),
        .IDEX_RegWrite(IDEX_RegWrite),
        .IDEX_ALUSrc(IDEX_ALUSrc),
        .IDEX_ALUOp(IDEX_ALUOp),
        .IDEX_Funct(IDEX_Funct),
        .IDEX_rs1(IDEX_rs1),
        .IDEX_rs2(IDEX_rs2),
        .IDEX_rd(IDEX_rd),
        .IDEX_PC_Out(IDEX_PC_Out),
        .IDEX_ReadData1(IDEX_ReadData1),
        .IDEX_ReadData2(IDEX_ReadData2),
        .imm_data1(imm_data1)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // Clock period = 10ns
    end

    // Test stimulus
    initial begin
        // Initialize inputs
        reset = 1;
//        flush = 0;
        Branch = 0;
        MemRead = 0;
        MemWrite = 0;
        MemtoReg = 0;
        RegWrite = 0;
        ALUSrc = 0;
        ALUOp = 2'b00;
        Funct = 4'b0000;
        rs1 = 5'b00000;
        rs2 = 5'b00000;
        rd = 5'b00000;
        IFID_PC_Out = 64'd0;
        ReadData1 = 64'd0;
        ReadData2 = 64'd0;
        imm_data = 64'd0;

        // Reset active
        #10;
        reset = 0;

        // Test Case 1: Apply some inputs
        #10;
        Branch = 1;
        MemRead = 1;
        MemWrite = 0;
        MemtoReg = 1;
        RegWrite = 1;
        ALUSrc = 1;
        ALUOp = 2'b10;
        Funct = 4'b1001;
        rs1 = 5'b00001;
        rs2 = 5'b00010;
        rd = 5'b00011;
        IFID_PC_Out = 64'd100;
        ReadData1 = 64'd200;
        ReadData2 = 64'd300;
        imm_data = 64'd400;

        // Wait and observe outputs
        #20;

        // Test Case 2: Apply different inputs
        Branch = 0;
        MemRead = 0;
        MemWrite = 1;
        MemtoReg = 0;
        RegWrite = 1;
        ALUSrc = 0;
        ALUOp = 2'b01;
        Funct = 4'b0010;
        rs1 = 5'b01000;
        rs2 = 5'b01001;
        rd = 5'b01010;
        IFID_PC_Out = 64'd500;
        ReadData1 = 64'd600;
        ReadData2 = 64'd700;
        imm_data = 64'd800;

        // Wait and observe outputs
        #20;

        // Finish simulation
        $stop;
    end
endmodule
