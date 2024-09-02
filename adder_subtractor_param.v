`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/17/2022 06:38:36 PM
// Design Name: 
// Module Name: adder_subtractor_param
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


module adder_subtractor_param(c_out, result, a, b, c_in, select);

    parameter size = 1;
    
    input select, c_in;
    input[size-1:0] a, b;
    output c_out;
    output [size-1:0] result;
    
    wire[size:0] c_int; //one bigger than op
    assign c_int[0] = c_in;
    
    wire [size-1:0] b_xor_select;
    
    genvar i; 
    generate
        for(i = 0; i < size; i = i + 1) begin
            xor g0(b_xor_select[i], select, b[i]);
        end
        for(i = 0; i < size; i = i + 1) begin
            FA_str FA(c_int[i+1], result[i], a[i], b_xor_select[i], c_int[i]);
        end
    endgenerate
    
    assign c_out = c_int[size];
    
endmodule
