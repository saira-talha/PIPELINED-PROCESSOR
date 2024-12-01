module Data_Memory(
input [63:0] Mem_Addr,
input [63:0] Write_Data,
input clk, Mem_Write, Mem_Read,
output reg [63:0] Read_Data,
output [63:0] va11,
output [63:0] va12,
output [63:0] va13,
output [63:0] va14,
output [63:0] va15,
output [63:0] va16,
output [63:0] va17,
output [63:0] va18
);
reg [7:0] DataMemory [255:0];
integer i;
initial
begin
for (i = 0;i<256;i = i + 1)begin
    DataMemory[i] = 0;
end
      DataMemory[0] = 8'd10;
      DataMemory[8] = 8'd9;
      DataMemory[16] = 8'd8;
      DataMemory[24] = 8'd7;
      DataMemory[32] = 8'd6;
      DataMemory[40] = 8'd5;
      DataMemory[48] = 8'd4;
      DataMemory[56] = 8'd3;
end
  assign va11 = {DataMemory[7],DataMemory[6],DataMemory[5],DataMemory[4],DataMemory[3],DataMemory[2],DataMemory[1],DataMemory[0]};
  assign va12 = {DataMemory[15],DataMemory[14],DataMemory[13],DataMemory[12],DataMemory[11],DataMemory[10],DataMemory[9],DataMemory[8]};
  assign va13 = {DataMemory[23],DataMemory[22],DataMemory[21],DataMemory[20],DataMemory[19],DataMemory[18],DataMemory[17],DataMemory[16]};
  assign va14 = {DataMemory[31],DataMemory[30],DataMemory[29],DataMemory[28],DataMemory[27],DataMemory[26],DataMemory[25],DataMemory[24]};
  assign va15 = {DataMemory[39],DataMemory[38],DataMemory[37],DataMemory[36],DataMemory[35],DataMemory[34],DataMemory[33],DataMemory[32]};
  assign va16 = {DataMemory[47],DataMemory[46],DataMemory[45],DataMemory[44],DataMemory[43],DataMemory[42],DataMemory[41],DataMemory[40]};
  assign va17 = {DataMemory[55],DataMemory[54],DataMemory[53],DataMemory[52],DataMemory[51],DataMemory[50],DataMemory[49],DataMemory[48]};
  assign va18 = {DataMemory[63],DataMemory[62],DataMemory[61],DataMemory[60],DataMemory[59],DataMemory[58],DataMemory[57],DataMemory[56]};
always @ (*)
begin
if (Mem_Read==1'b1)
Read_Data =
{DataMemory[Mem_Addr+7],DataMemory[Mem_Addr+6],DataMemory[Mem_Addr+5],DataMemory[Mem_Addr+4]
,DataMemory[Mem_Addr+3],DataMemory[Mem_Addr+2],DataMemory[Mem_Addr+1],DataMemory[Mem_Addr]};
end
always @ (posedge clk)
begin
if (Mem_Write==1'b1)
begin
DataMemory[Mem_Addr] = Write_Data[7:0];
DataMemory[Mem_Addr+1] = Write_Data[15:8];
DataMemory[Mem_Addr+2] = Write_Data[23:16];
DataMemory[Mem_Addr+3] = Write_Data[31:24];
DataMemory[Mem_Addr+4] = Write_Data[39:32];
DataMemory[Mem_Addr+5] = Write_Data[47:40];
DataMemory[Mem_Addr+6] = Write_Data[55:48];
DataMemory[Mem_Addr+7] = Write_Data[63:56];
end
end
endmodule



//module Data_Memory(
//  input [63:0]Mem_Addr,
//  input [63:0]Write_Data,
//  input clk,
//  input  Mem_Write,
//  input Mem_Read,
 
//  output reg [63:0]Read_Data,
//  output reg [63:0]D1,
//  output reg [63:0]D2, 
//  output reg [63:0]D3,
//  output reg [63:0]D4,
//  output reg [63:0]D5,
//  output reg [63:0]D6,
//  output reg [63:0]D7,
//  output reg [63:0]D8,
//  output reg [63:0]D9,
//  output reg [63:0]D10);
 
//  reg [7:0]D_Memory[99:0];
//  integer i;
  
//  initial 
//    begin 
//      for ( i=0;i<100;i=i+1)
//        D_Memory[i]=0;
      
//      D_Memory[0]=10;
//      D_Memory[8]=9;
//      D_Memory[16]=8;
//      D_Memory[24]=7;
//      D_Memory[32]=6;
//      D_Memory[40]=5;
//      D_Memory[48]=4;
//      D_Memory[56]=3;
//      D_Memory[64]=2;
//      D_Memory[72]=1;
//    end	
  
//  always @(negedge clk) 
//    begin
//    D1 = {D_Memory[7], D_Memory[6], D_Memory[5], D_Memory[4], D_Memory[3],D_Memory[2],D_Memory[1],D_Memory[0]};
//    D2 = {D_Memory[15], D_Memory[14], D_Memory[13], D_Memory[12], D_Memory[11],D_Memory[10],D_Memory[9],D_Memory[8]};
//    D3 = {D_Memory[23], D_Memory[22], D_Memory[21], D_Memory[20], D_Memory[19],D_Memory[18],D_Memory[17],D_Memory[16]};
//    D4 = {D_Memory[31], D_Memory[30], D_Memory[29], D_Memory[28], D_Memory[27],D_Memory[26],D_Memory[25],D_Memory[24]};
//    D5 = {D_Memory[39], D_Memory[38], D_Memory[37], D_Memory[36], D_Memory[35],D_Memory[34],D_Memory[33],D_Memory[32]};
//    D6 = {D_Memory[47], D_Memory[46], D_Memory[45], D_Memory[44], D_Memory[43],D_Memory[42],D_Memory[41],D_Memory[40]};
//    D7 = {D_Memory[55], D_Memory[54], D_Memory[53], D_Memory[52], D_Memory[51],D_Memory[50],D_Memory[49],D_Memory[48]};
//    D8 = {D_Memory[63], D_Memory[62], D_Memory[61], D_Memory[60], D_Memory[59],D_Memory[58],D_Memory[57],D_Memory[56]};
//    D9 = {D_Memory[71], D_Memory[70], D_Memory[69], D_Memory[68], D_Memory[67],D_Memory[66],D_Memory[65],D_Memory[64]};
//    D10 = {D_Memory[79], D_Memory[78], D_Memory[77], D_Memory[76], D_Memory[75],D_Memory[74],D_Memory[73],D_Memory[72]};
//  end
  
    
//  always @(*)
//    begin 
//      if (Mem_Read == 1'b1)
//        Read_Data = {D_Memory[Mem_Addr + 7], D_Memory[Mem_Addr + 6], D_Memory[Mem_Addr + 5], D_Memory[Mem_Addr + 4], D_Memory[Mem_Addr + 3],D_Memory[Mem_Addr + 2],D_Memory[Mem_Addr + 1],D_Memory[Mem_Addr]};
//    end
  
//  always @ (posedge clk)
//    begin
//      if (Mem_Write == 1'b1)

//        begin
//          D_Memory[Mem_Addr] = Write_Data[7:0];
//          D_Memory[Mem_Addr+1] = Write_Data[15:8];
//          D_Memory[Mem_Addr+2] = Write_Data[23:16];
//          D_Memory[Mem_Addr+3] = Write_Data[31:24];
//          D_Memory[Mem_Addr+4] = Write_Data[39:32];
//          D_Memory[Mem_Addr+5] = Write_Data[47:40];
//      	  D_Memory[Mem_Addr+6] = Write_Data[55:48];
//          D_Memory[Mem_Addr+7] = Write_Data[63:56];
//        end

//    end
//endmodule	


//module Data_Memory(
//    input clk,
//    input Mem_Write,
//    input Mem_Read,
//    input [63:0] Mem_Addr,
//    input [63:0] Write_Data,
//    output reg [63:0] Read_Data,
//    //
//	output [63:0] va11,
//output [63:0] va12,
//output [63:0] va13,
//output [63:0] va14,
//output [63:0] va15,
//output [63:0] va16,
//output [63:0] va17,
//output [63:0] va18
//    );

//    reg [7:0] DataMemory [63:0];


//	integer i;
//  initial
//    begin
//      for (i=0; i<64; i=i+1)
//        begin
//          DataMemory[i] = 0;
    
//        end
//      DataMemory[0] = 8'd5;
//      DataMemory[8] = 8'd2;
//      DataMemory[16] = 8'd1;
//      DataMemory[24] = 8'd7;
//      DataMemory[32] = 8'd4;
//    end
	
//  assign index0 = {DataMemory[7],DataMemory[6],DataMemory[5],DataMemory[4],DataMemory[3],DataMemory[2],DataMemory[1],DataMemory[0]};
//  assign index1 = {DataMemory[15],DataMemory[14],DataMemory[13],DataMemory[12],DataMemory[11],DataMemory[10],DataMemory[9],DataMemory[8]};
//  assign index2 = {DataMemory[23],DataMemory[22],DataMemory[21],DataMemory[20],DataMemory[19],DataMemory[18],DataMemory[17],DataMemory[16]};
//  assign index3 = {DataMemory[31],DataMemory[30],DataMemory[29],DataMemory[28],DataMemory[27],DataMemory[26],DataMemory[25],DataMemory[24]};
//  assign index4 = {DataMemory[39],DataMemory[38],DataMemory[37],DataMemory[36],DataMemory[35],DataMemory[34],DataMemory[33],DataMemory[32]};
  
	
//	always @ (*)
//	begin
//		if (Mem_Read)
//			Read_Data = {DataMemory[Mem_Addr+7],DataMemory[Mem_Addr+6],DataMemory[Mem_Addr+5],DataMemory[Mem_Addr+4],DataMemory[Mem_Addr+3],DataMemory[Mem_Addr+2],DataMemory[Mem_Addr+1],DataMemory[Mem_Addr]};
//	end
	
//	always @ (posedge clk)
//	begin
//		if (Mem_Write)
//		begin
//			DataMemory[Mem_Addr] = Write_Data[7:0];
//			DataMemory[Mem_Addr+1] = Write_Data[15:8];
//			DataMemory[Mem_Addr+2] = Write_Data[23:16];
//			DataMemory[Mem_Addr+3] = Write_Data[31:24];
//			DataMemory[Mem_Addr+4] = Write_Data[39:32];
//			DataMemory[Mem_Addr+5] = Write_Data[47:40];
//			DataMemory[Mem_Addr+6] = Write_Data[55:48];
//			DataMemory[Mem_Addr+7] = Write_Data[63:56];
//		end
//	end

//endmodule