`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/25/2022 02:46:34 PM
// Design Name: 
// Module Name: SLT_param
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


module SLT_param(out, a, b);

    parameter size = 32;
    
    input [size-1:0] a, b;
    output [size-1:0] out;
    
    reg [size-1:0] out_int;
    
    always @ (*) begin
        if (a < b) begin
            out_int[size-1:1] = 31'd0;
            out_int[0] = 1'b1;
        end else
            out_int[size-1:1] = 31'd0;
            out_int[0] = 1'b0;
    end
    
    assign out = out_int;
    
endmodule
