`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/05/2023 04:04:44 AM
// Design Name: 
// Module Name: timer
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


module timer#(parameter final_value =29)
(input reset, enable, clk,
output done
//output [bits-1:0]Q
  );
    localparam bits=$clog2(final_value);
      reg [bits-1:0]Q_reg,Q_next;
    
      always@(posedge clk, posedge reset)
      begin
      if (reset)
      Q_reg=0;
      else if (enable)
      Q_reg<=Q_next;
      else 
       Q_reg<= Q_reg;
      
      end
      assign done=Q_reg==final_value;
      always@(*)
      begin
      Q_next=done? 'b0 :Q_reg+1;
      
      end
      //assign Q=Q_reg;
endmodule
