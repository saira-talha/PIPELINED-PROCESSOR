//module Instruction_Memory
//(
//input [63:0] Inst_address,
//output reg [31:0] Instruction
//);

//reg [7:0] memory [147:0];

//initial
//begin
//	//addi x1,zero,4
	
	
////	memory[0] <= 8'b10010011;
////	memory[1] <= 8'b00000000;
////	memory[2] <= 8'b01000000;
////	memory[3] <= 8'b00000000;
//	//addi x22,zero,0
//	memory[4] <= 8'b00010011;
//	memory[5] <= 8'b00001011;
//	memory[6] <= 8'b00000000;
//	memory[7] <= 8'b00000000;
//	//addi x23,zero,0
//	memory[8] <= 8'b10010011;
//	memory[9] <= 8'b00001011;
//	memory[10] <= 8'b00000000;
//	memory[11] <= 8'b00000000;
//	//add x5,zero,zero
//	memory[12] <= 8'b10110011;
//	memory[13] <= 8'b00000010;
//	memory[14] <= 8'b00000000;
//	memory[15] <= 8'b00000000;
//	//add x2,zero,zero
//	memory[16] <= 8'b00110011;
//	memory[17] <= 8'b00000001;
//	memory[18] <= 8'b00000000;
//	memory[19] <= 8'b00000000;
//	//addi x3,zero,0 array
//	memory[20] <= 8'b10010011;
//	memory[21] <= 8'b00000001;
//	memory[22] <= 8'b00000000;
//	memory[23] <= 8'b00000000;
//	//add x12, x2, x3
//	memory[24] <= 8'b00110011;
//	memory[25] <= 8'b00000110;
//	memory[26] <= 8'b00110001;
//	memory[27] <= 8'b00000000;
//	//sw x22, 0(x12)
//	memory[28] <= 8'b00100011;
//	memory[29] <= 8'b00100000;
//	memory[30] <= 8'b01100110;
//	memory[31] <= 8'b00000001;
//	//addi x22, x22, 1
//	memory[32] <= 8'b00010011;
//	memory[33] <= 8'b00001011;
//	memory[34] <= 8'b00011011;
//	memory[35] <= 8'b00000000;
//	//addi x2,x2,8
//	memory[36] <= 8'b00010011;
//	memory[37] <= 8'b00000001;
//	memory[38] <= 8'b10000001;
//	memory[39] <= 8'b00000000;
//	//bne x22, x1, Loop
//	memory[40] <= 8'b11100011;
//	memory[41] <= 8'b00011000;
//	memory[42] <= 8'b00011011;
//	memory[43] <= 8'b11111110;
//	//addi x22, zero, 0
//	memory[44] <= 8'b00010011;
//	memory[45] <= 8'b00001011;
//	memory[46] <= 8'b00000000;
//	memory[47] <= 8'b00000000;
//	//add x2,zero,zero
//	memory[48] <= 8'b00110011;
//	memory[49] <= 8'b00000001;
//	memory[50] <= 8'b00000000;
//	memory[51] <= 8'b00000000;
//	//add x11,zero,zero
//	memory[52] <= 8'b10110011;
//	memory[53] <= 8'b00000101;
//	memory[54] <= 8'b00000000;
//	memory[55] <= 8'b00000000;
//	//add x23,zero,x22
//	memory[56] <= 8'b10110011;
//	memory[57] <= 8'b00001011;
//	memory[58] <= 8'b01100000;
//	memory[59] <= 8'b00000001;
//	//add x12, x2, x3
//	memory[60] <= 8'b00110011;
//	memory[61] <= 8'b00000110;
//	memory[62] <= 8'b00110001;
//	memory[63] <= 8'b00000000;
//	//lw x15, 0(x12)
//	memory[64] <= 8'b10000011;
//	memory[65] <= 8'b00100111;
//	memory[66] <= 8'b00000110;
//	memory[67] <= 8'b00000000;
//	//addi x11,x23,0
//	memory[68] <= 8'b10010011;
//	memory[69] <= 8'b10000101;
//	memory[70] <= 8'b00001011;
//	memory[71] <= 8'b00000000;
//	//add x11,x11,x23
//	memory[72] <= 8'b10110011;
//	memory[73] <= 8'b10000101;
//	memory[74] <= 8'b01110101;
//	memory[75] <= 8'b00000001;
//	//add x11,x11,x23
//	memory[76] <= 8'b10110011;
//	memory[77] <= 8'b10000101;
//	memory[78] <= 8'b01110101;
//	memory[79] <= 8'b00000001;
//	//add x11,x11,x23
//	memory[80] <= 8'b10110011;
//	memory[81] <= 8'b10000101;
//	memory[82] <= 8'b01110101;
//	memory[83] <= 8'b00000001;
//	//add x11,x11,x23
//	memory[84] <= 8'b10110011;
//	memory[85] <= 8'b10000101;
//	memory[86] <= 8'b01110101;
//	memory[87] <= 8'b00000001;
//	//add x11,x11,x23
//	memory[88] <= 8'b10110011;
//	memory[89] <= 8'b10000101;
//	memory[90] <= 8'b01110101;
//	memory[91] <= 8'b00000001;
//	//add x11,x11,x23
//	memory[92] <= 8'b10110011;
//	memory[93] <= 8'b10000101;
//	memory[94] <= 8'b01110101;
//	memory[95] <= 8'b00000001;
//	//add x11,x11,x23
//	memory[96] <= 8'b10110011;
//	memory[97] <= 8'b10000101;
//	memory[98] <= 8'b01110101;
//	memory[99] <= 8'b00000001;
//	//add x10, x11, x3	
//	memory[100] <= 8'b00110011;
//	memory[101] <= 8'b10000101;
//	memory[102] <= 8'b00110101;
//	memory[103] <= 8'b00000000;
//	//lw x16, 0(x10)
//	memory[104] <= 8'b00000011;
//	memory[105] <= 8'b00101000;
//	memory[106] <= 8'b00000101;
//	memory[107] <= 8'b00000000;
//	//blt x15,x16,else
//	memory[108] <= 8'b01100011;
//	memory[109] <= 8'b11000100;
//	memory[110] <= 8'b00000111;
//	memory[111] <= 8'b00000001;
//	//beq x0,x0,exit
//	memory[112] <= 8'b01100011;
//	memory[113] <= 8'b00001000;
//	memory[114] <= 8'b00000000;
//	memory[115] <= 8'b00000000;
//	//add x5, zero, x15
//	memory[116] <= 8'b10110011;
//	memory[117] <= 8'b00000010;
//	memory[118] <= 8'b11110000;
//	memory[119] <= 8'b00000000;
//	//sw x16, 0(x12)
//	memory[120] <= 8'b00100011;
//	memory[121] <= 8'b00100000;
//	memory[122] <= 8'b00000110;
//	memory[123] <= 8'b00000001;
//	//sw x5, 0(x10)
//	memory[124] <= 8'b00100011;
//	memory[125] <= 8'b00100000;
//	memory[126] <= 8'b01010101;
//	memory[127] <= 8'b00000000;
//	//addi x23,x23,1
//	memory[128] <= 8'b10010011;
//	memory[129] <= 8'b10001011;
//	memory[130] <= 8'b00011011;
//	memory[131] <= 8'b00000000;
//	//bne x23, x1, loopinner
//	memory[132] <= 8'b11100011;
//	memory[133] <= 8'b10011100;
//	memory[134] <= 8'b00011011;
//	memory[135] <= 8'b11111010;
//	//addi x22, x22, 1
//	memory[136] <= 8'b00010011;
//	memory[137] <= 8'b00001011;
//	memory[138] <= 8'b00011011;
//	memory[139] <= 8'b00000000;
//	//addi x2,x2,8
//	memory[140] <= 8'b00010011;
//	memory[141] <= 8'b00000001;
//	memory[142] <= 8'b10000001;
//	memory[143] <= 8'b00000000;
//	//bne x22, x1, loopouter
//	memory[144] <= 8'b11100011;
//	memory[145] <= 8'b00010100;
//	memory[146] <= 8'b00011011;
//	memory[147] <= 8'b11111010;
//end

//always@(*)
//	Instruction = {memory[Inst_address + 3], memory[Inst_address + 2], memory[Inst_address + 1], memory[Inst_address]};
	
//endmodule	
	
	
module Instruction_Memory
(
	input [63:0] Inst_address,
	output reg [31:0] Instruction
);
	reg [7:0] inst_mem[160:0];
	initial
	begin   
//	{inst_mem[3], inst_mem[2], inst_mem[1], inst_mem[0]} = 32'h0020A083;//2
    {inst_mem[3], inst_mem[2], inst_mem[1], inst_mem[0]} = 32'h00210493;//
//    {inst_mem[7], inst_mem[6], inst_mem[5], inst_mem[4]} = 32'h00012103;//1
       {inst_mem[7], inst_mem[6], inst_mem[5], inst_mem[4]} =32'h00518233;
      {inst_mem[11], inst_mem[10], inst_mem[9], inst_mem[8]} = 32'h00000413;//3
      {inst_mem[15], inst_mem[14], inst_mem[13], inst_mem[12]} = 32'h00050513;//4
      {inst_mem[19], inst_mem[18], inst_mem[17], inst_mem[16]} = 32'h00500113;//5	
      {inst_mem[23], inst_mem[22], inst_mem[21], inst_mem[20]} = 32'h00200193;//6
      {inst_mem[27], inst_mem[26], inst_mem[25], inst_mem[24]} = 32'h00100213;//7
      {inst_mem[31], inst_mem[30], inst_mem[29], inst_mem[28]} = 32'h00700593;//8
      {inst_mem[35], inst_mem[34], inst_mem[33], inst_mem[32]} = 32'h00400613;//9
      {inst_mem[39], inst_mem[38], inst_mem[37], inst_mem[36]} = 32'h07340663;//10	
      {inst_mem[43], inst_mem[42], inst_mem[41], inst_mem[40]} = 32'h00000493;//11
      {inst_mem[47], inst_mem[46], inst_mem[45], inst_mem[44]} = 32'h00000513;//12
      {inst_mem[51], inst_mem[50], inst_mem[49], inst_mem[48]} = 32'hfff98313;//13
      {inst_mem[55], inst_mem[54], inst_mem[53], inst_mem[52]} = 32'h40830333;//14
      {inst_mem[59], inst_mem[58], inst_mem[57], inst_mem[56]} = 32'h04648663;//15
      {inst_mem[63], inst_mem[62], inst_mem[61], inst_mem[60]} = 32'h00349393;//16
      {inst_mem[67], inst_mem[66], inst_mem[65], inst_mem[64]} = 32'h012383b3;//17
      {inst_mem[71], inst_mem[70], inst_mem[69], inst_mem[68]} = 32'h0003b283;//18
      {inst_mem[75], inst_mem[74], inst_mem[73], inst_mem[72]} = 32'h00148e93;//19
      {inst_mem[79], inst_mem[78], inst_mem[77], inst_mem[76]} = 32'h003e9e13;//20
      {inst_mem[83], inst_mem[82], inst_mem[81], inst_mem[80]} = 32'h012e0e33;//21
      {inst_mem[87], inst_mem[86], inst_mem[85], inst_mem[84]} = 32'h000e3f03;//22
      {inst_mem[91], inst_mem[90], inst_mem[89], inst_mem[88]} = 32'h005f4663;//23
      {inst_mem[95], inst_mem[94], inst_mem[93], inst_mem[92]} = 32'h00148493;//24
      {inst_mem[99], inst_mem[98], inst_mem[97], inst_mem[96]} = 32'hfc000ce3;//25
      {inst_mem[103], inst_mem[102], inst_mem[101], inst_mem[100]} = 32'h00028f93;//26
      {inst_mem[107], inst_mem[106], inst_mem[105], inst_mem[104]} = 32'h000f0293;//27
      {inst_mem[111], inst_mem[110], inst_mem[109], inst_mem[108]} = 32'h0053b023;//28
      {inst_mem[115], inst_mem[114], inst_mem[113], inst_mem[112]} = 32'h000f8f13;//29
      {inst_mem[119], inst_mem[118], inst_mem[117], inst_mem[116]} = 32'h01ee3023;//31
      {inst_mem[123], inst_mem[122], inst_mem[121], inst_mem[120]} = 32'h00100513;//32
      {inst_mem[127], inst_mem[126], inst_mem[125], inst_mem[124]} = 32'h00148493;//33
      {inst_mem[131], inst_mem[130], inst_mem[129], inst_mem[128]} = 32'hfa000ce3;//34
      {inst_mem[135], inst_mem[134], inst_mem[133], inst_mem[132]} = 32'h00140413;//35
      {inst_mem[139], inst_mem[138], inst_mem[137], inst_mem[136]} = 32'h00050463;//36
      {inst_mem[143], inst_mem[142], inst_mem[141], inst_mem[140]} = 32'hf8000ce3;//37
    end	  
	always @(Inst_address)
	begin
		Instruction={inst_mem[Inst_address+3],inst_mem[Inst_address+2],inst_mem[Inst_address+1],inst_mem[Inst_address]};
	end

//module Instruction_Memory
//(
//    input [63:0] Inst_address,
//    output reg [31:0]Instruction
//);

//    reg [7:0] I_Memory [11:0];

//    initial 
//        begin
//            {I_Memory[3], I_Memory[2], I_Memory[1], I_Memory[0]} = 32'h00210493; 
//            // add x1 x2 x3
//            {I_Memory[7], I_Memory[6], I_Memory[5], I_Memory[4]} = 32'h00308133; 
//            // add x2 x1 x3
//            {I_Memory[11], I_Memory[10], I_Memory[9], I_Memory[8]} = 32'h00108193; 
//            // addi x3 x1 1      
//        end

//    always @(*)   // Fethcing address.  
//        Instruction = {I_Memory[Inst_address +3], I_Memory[Inst_address + 2], I_Memory[Inst_address + 1], I_Memory[Inst_address]};

endmodule