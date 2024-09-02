`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/14/2022 07:56:19 PM
// Design Name: 
// Module Name: bit_not_param
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


module bit_not_param(out, in);

    parameter size = 1;
    
    input[size-1:0] in;
    output[size-1:0] out;
    
    genvar i;
    generate
        for(i = 0; i < size; i = i + 1) begin
            not g0(out[i], in[i]);
        end
    endgenerate
    
endmodule
