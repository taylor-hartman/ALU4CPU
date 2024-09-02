`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/17/2022 04:03:38 PM
// Design Name: 
// Module Name: NAND_param
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


module AND_param(result, a, b);

    parameter size = 1;
    
    input [size-1:0] a, b;
    output [size-1:0] result;
    
    wire[size-1:0] w0;
    
    genvar i; 
    generate
        for(i = 0; i < size; i = i + 1) begin
            and(w0[i], a[i], b[i]);
        end
    endgenerate
    
    assign result = w0;
    
endmodule
