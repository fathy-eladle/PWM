`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/04/2023 01:34:40 AM
// Design Name: 
// Module Name: Pwm
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


module Pwm #(parameter R=8, final_value=20)(
input clk, reset,
input [R:0]d,
output pwm
    );
    reg [R-1:0]Q_reg,Q_next;
    reg d_reg ,d_next;
    wire enable;
    always @(posedge clk , posedge reset)
    if (reset)
    begin
    Q_reg<='b0;
    d_reg<='b0;
    end
    else if (enable)
    begin
    Q_reg<=Q_next;
    d_reg<=d_next;
    end
    else 
    begin
    Q_reg<=Q_reg;
    d_reg<=d_reg;
    end
   always@(*)
   begin
   Q_next=Q_reg+1;
   d_next=(Q_reg<d);
   end
   
    
    timer #(.final_value(final_value)) t0(
    .reset(reset),
    .enable('b1),
    .clk(clk),
    .done(enable)
   
    );
   
     assign pwm =d_reg;
    
endmodule
