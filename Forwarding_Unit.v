`timescale 1ns / 1ps

module Forwarding_Unit
(
  input [4:0] IDEX_rs1,
  input [4:0] IDEX_rs2,
  input [4:0] rd_2,
  input RegWrite_2,
  input [4:0] rd_3,
  input RegWrite_3,
  
  output reg [1:0] Forward_A, Forward_B

);

  
  always @(*)
    begin
      
      
                       //Forward A
      
      //1a. EX/MEM.RegisterRd == ID/EX.RegisterRs1
      if ((rd_2 == IDEX_rs1) && (RegWrite_2 == 1) && (rd_2 != 0))

		Forward_A = 2'b10;   //ForwardA = 10
      
		
	  //2a. MEM/WB.RegisterRd == ID/EX.RegisterRs1
      else if ((rd_3 == IDEX_rs1) && (RegWrite_3 == 1) && (rd_3 != 0) && !(RegWrite_2 == 1 && rd_2 != 0 && rd_2 == IDEX_rs1))
        
		Forward_A = 2'b01;  //ForwardA = 01
      
      
      else
        Forward_A = 2'b00; //ForwardA = 00
			
      
      
      
      				//Forward B

		
      //1b. EX/MEM.RegisterRd == ID/EX.RegisterRs2
      if ((rd_2 == IDEX_rs2) && (RegWrite_2 == 1) && (rd_2 != 0))

		Forward_B = 2'b10;   //ForwardB = 10
		
      //2b. MEM/WB.RegisterRd == ID/EX.RegisterRs2
      else if ((rd_3 == IDEX_rs2) && (RegWrite_3 == 1) && (rd_3 != 0) &&!(RegWrite_2 == 1 && rd_2 != 0 && rd_2 == IDEX_rs2))
        
		Forward_B = 2'b01;  //ForwardB = 01
      
      
      else
        Forward_B = 2'b00; //ForwardB = 00
    
    
    end

endmodule

