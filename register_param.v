`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/14/2022 06:48:59 PM
// Design Name: 
// Module Name: register_param
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


module register_param(q, d, clk, rst);

    parameter size = 1; //default size to 1 bit
    
    input clk, rst;
    input [size-1:0] d;
    output [size-1:0] q;
    
    genvar i;
    generate
        for(i = 0; i < size; i = i + 1) begin
            dff d(q[i], d[i], clk, rst);
        end
    endgenerate

endmodule
