module branch_control_unit(
   input [2:0] funct3,
   input [63:0] ReadData1, b,
   output reg addermuxselect
  );
  initial begin
      addermuxselect = 1'b0;
    end 
  always @(*)begin
      case (funct3)
        3'b000: begin
            if (ReadData1 == b)
              addermuxselect = 1'b1;
            else
              addermuxselect = 1'b0;
            end
         3'b100:begin
              if (ReadData1 < b)
              addermuxselect = 1'b1;
            else
              addermuxselect = 1'b0;
            end
        3'b101:begin
            if (ReadData1 > b)
          	addermuxselect = 1'b1;
           else
              addermuxselect = 1'b0;
          end    
      endcase
     end
endmodule
